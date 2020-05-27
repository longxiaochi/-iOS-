//
//  LoginViewController.swift
//  BlogClient
//
//  Created by Long on 2020/5/13.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: WKWebViewController {
    override func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let url = webView.url?.absoluteString {
            if url.hasPrefix("https://oauth.cnblogs.com/auth/callback") {
                let code = url.lc.urlParameterValue("code")
                
                log("code = \(code!)")
                StoreHelper.storeValue(code, forKey: US.key.code)
                decisionHandler(.allow)
                
                let parameter = [API.rpk.client_id : API.rpv.client_id,
                                 API.rpk.client_secret : API.rpv.client_secret,
                                 API.rpk.grant_type : API.rpv.grant_type_authorization_code,
                                 API.rpk.code : StoreHelper.valueForKey(US.key.code) ?? "",
                                 API.rpk.redirect_uri : API.rpv.redirect_uri
                ]
                NetworkTool.request(url: API.url.connectToken, method: .post, parameter: parameter) {
                    response in
                    
                    guard let dict = response.value else {
                        // 请求失败了
                        return
                    }
                    let jsons = SwiftyJSON.JSON(dict).dictionaryValue
                    let model: OAuth = KakaJSON.model(from: jsons, OAuth.self)
                    model.expiresDate = Date().addingTimeInterval(model.expiresIn)
                    KakaJSON.write(model, to: FilePath.oauthFilePath)
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } else {
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.allow)
        }
    }
}




