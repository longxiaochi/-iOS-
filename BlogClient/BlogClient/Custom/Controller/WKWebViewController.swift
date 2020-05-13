//
//  WKWebViewController.swift
//  BlogClient
//
//  Created by Long on 2020/5/12.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIBaseViewController {
    
    var wkWebView: WKWebView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - InitViewProtocol
extension WKWebViewController: InitViewProtocol {
    func initView() {
        // wkwebview
        wkWebView = initWKWebView()
        self.view.addSubview(wkWebView)
        
        // 加载动画
        self.view.showHUD()
    }
    
    func autoLayoutView() {
        wkWebView.mas_makeConstraints { (make) in
            make?.leading.trailing()?.top()?.bottom()?.mas_equalTo()(self.view)?.offset()(0)
        }
    }
    
    func initWKWebView() -> WKWebView {
        let wkWebView = WKWebView(frame: CGRect.zero, configuration: configuration())
        
        wkWebView.navigationDelegate = self
        wkWebView.uiDelegate = self
        
        wkWebView.addObserver(self, forKeyPath: UniversalString.keyPath.estimatedProgress, options: .new, context: nil)
        wkWebView.addObserver(self, forKeyPath: UniversalString.keyPath.title, options: .new, context: nil)
        return wkWebView
    }
    
    func configuration() -> WKWebViewConfiguration {
        let configuration = WKWebViewConfiguration()
        configuration.preferences = WKPreferences()
        configuration.preferences.javaScriptEnabled = true
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        configuration.processPool = WKProcessPool()
        configuration.allowsInlineMediaPlayback = true
        configuration.userContentController = userContentController()
        return configuration
    }
    
    func userContentController() -> WKUserContentController {
        let userContentController = WKUserContentController()
        return userContentController
    }
}

extension WKWebViewController {
    func postJs(_ url: URLConvertible, params: String) -> String {
        let postFunc =
                  """
                        function post(path, params) {
                        var method = "post";
                        var form = document.createElement("form");
                        form.setAttribute("method", method);
                        form.setAttribute("action", path);

                        for(var key in params) {
                            if(params.hasOwnProperty(key)) {
                                var hiddenField = document.createElement("input");
                                hiddenField.setAttribute("type", "hidden");
                                hiddenField.setAttribute("name", key);
                                hiddenField.setAttribute("value", params[key]);

                                form.appendChild(hiddenField);
                            }
                        }
                        document.body.appendChild(form);
                        form.submit();
                        }
                    """
//        return postFunc
        
        
        let js = "\(postFunc)post(\(url),\(params))"
        return js
    }
}

// MARK: - KVO
extension WKWebViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let kp = keyPath else { return }
        
        if kp == UniversalString.keyPath.estimatedProgress {
            if let ch = change {
                let progress = ch[.newKey] as? Double
                if let pg = progress {
                    // 当前的进度
                    
                }
            }
        } else if kp == UniversalString.keyPath.title {
            if let ch = change {
                guard let title = ch[.newKey] as? String else { return }
                // 可以设置网页的标题
                
            }
        }
    }
}

// MARK: - WKNavigationDelegate
extension WKWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.view.hideHUD()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.view.hideHUD()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.view.hideHUD()
    }
 
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        self.view.hideHUD()
    }
}

// MARK: - WKUIDelegate
extension WKWebViewController: WKUIDelegate {
    
}
