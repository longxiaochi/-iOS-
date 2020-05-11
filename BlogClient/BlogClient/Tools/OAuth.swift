//
//  OAuth.swift
//  BlogClient
//
//  Created by Long on 2020/5/11.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

class OAuth: NSObject, Convertible, NSSecureCoding{
    var accessToken: String    // access_token 存储OAuth登录所需的access_token
    var expiresIn: Int         // expires_in OAuth登录后，access_token过期时间
    var tokenType: String      // token的类型
    var refreshToken: String   // refresh_token access_token过期后，不需要让用户重新登录，直接使用refresh_token重新登录
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }
    
    required override init() {
        accessToken = ""
        expiresIn = 0
        tokenType = ""
        refreshToken = ""
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        accessToken = coder.decodeObject(forKey: "accessToken") as! String
        expiresIn = coder.decodeInteger(forKey: "expiresIn")
        tokenType = coder.decodeObject(forKey: "tokenType") as! String
        refreshToken = coder.decodeObject(forKey: "refreshToken") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(accessToken, forKey: "accessToken")
        coder.encode(expiresIn, forKey: "expiresIn")
        coder.encode(tokenType, forKey: "tokenType")
        coder.encode(refreshToken, forKey: "refreshToken")
    }
    
    static var supportsSecureCoding: Bool { true }
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
