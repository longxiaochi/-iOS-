//
//  LoginViewController.swift
//  BlogClient
//
//  Created by Long on 2020/5/13.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class LoginViewController: WKWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        do {
            let parameter = [API.rpk.client_id : API.rpv.client_id,
                             API.rpk.scope : API.rpv.scope,
                             API.rpk.response_type : API.rpv.response_type,
                             API.rpk.redirect_uri : API.rpv.redirect_uri,
                             API.rpk.state : API.rpv.state,
                             API.rpk.nonce : API.rpv.nonce]
//            let data = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
//            let json = try JSON(data: data)
            
            let encoder = JSONEncoder()
            if let jsonData = try? encoder.encode(parameter) {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    let js = postJs(API.url.connectAuthorize, params: jsonString)
//                    wkWebView.evaluateJavaScript(js, completionHandler: )
                    wkWebView.evaluateJavaScript(js) { (obj, error) in
                        log(error)
                    }
                }
                
            }
            
        } catch let error {
            log(error)
        }
    }
    
   
}




