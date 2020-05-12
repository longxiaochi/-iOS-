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
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let kp = keyPath, kp == UniversalString.keyPath.estimatedProgress {
            
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
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
 
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
}

// MARK: - WKUIDelegate
extension WKWebViewController: WKUIDelegate {
    
}
