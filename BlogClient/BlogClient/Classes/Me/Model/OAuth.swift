//
//  OAuth.swift
//  BlogClient
//
//  Created by Long on 2020/5/11.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

class OAuth: Convertible{
    var accessToken: String    // access_token 存储OAuth登录所需的access_token
    var expiresIn: Date        // expires_in OAuth登录后，access_token过期时间
    var tokenType: String      // token的类型
    var refreshToken: String   // refresh_token access_token过期后，不需要让用户重新登录，直接使用refresh_token重新登录
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }
    
    func kj_modelValue(from jsonValue: Any?,
                       _ property: Property) -> Any? {
        if property.name == "expiresIn" {
            if case .some(let value) = jsonValue {
                let number = "\(value)"
                if var val = Double(number) {
                    val += Date().timeIntervalSince1970
                    return ConvertibleConfig.modelValue(from: val, property, Self.self)
                }
            }
        }
        return ConvertibleConfig.modelValue(from: jsonValue, property, Self.self)
    }
    
    required init() {
        accessToken = ""
        expiresIn = Date()
        tokenType = ""
        refreshToken = ""
    }
    
    // 本地是否存在授权信息
    static func isLocalExistOauthData() -> Bool {
        guard let _ = read(OAuth.self, from: FilePath.oauthFilePath) else { return true }
        return true
    }
    
    // token是否已失效
    static func isAccessTokenExpired() -> Bool {
        guard let model: OAuth = read(OAuth.self, from: FilePath.oauthFilePath) else { return true }
        if model.expiresIn.compare(Date()) == .orderedDescending {
            return false
        }
        return true
    }
}


//extension OAuth: CustomStringConvertible, CustomDebugStringConvertible {
//    override var description: String {
//        "accessToken: \(accessToken), \n expiresIn: \(expiresIn), \n tokenType: \(tokenType), \n refreshToken: \(refreshToken)"
//    }
//
//    override var debugDescription: String {
//        "accessToken: \(accessToken), \n expiresIn: \(expiresIn), \n tokenType: \(tokenType), \n refreshToken: \(refreshToken)"
//    }
//}
