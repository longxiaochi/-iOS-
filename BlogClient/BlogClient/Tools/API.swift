//
//  API.swift
//  BlogClient
//
//  Created by Long on 2020/5/11.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

struct API {
    struct url {
        static let baseApiUrl = "https://api.cnblogs.com/api/"
        static let baseOauthUrl = "https://oauth.cnblogs.com/"
        
        // MARK: - 客户端授权
        static let connectToken = Self.oauthUrl("connect/token")
        
        // MARK: - 博客
        static let blogpostsSitehome = Self.url("blogposts/@sitehome")
        
        
        // API
        static func url(_ path: String) -> String {
            baseApiUrl + path
        }
        
        // 认证授权
        static func oauthUrl(_ path: String) -> String {
            baseOauthUrl + path
        }
    }
    
    // 请求参数的Key  request parameter key
    struct rpk {
        static let grant_type = "grant_type"
    }

    // 请求参数的Value  request parameter value
    struct rpv {
        // client_id
        static let client_id = "f12f7276-f09d-4979-9288-6ba71b303fb6"
        // client_secret
        static let client_secret = "bN1ZviZgoC-IyYix-DlSuCjZ3KdixeJEkMdTVazfJA5D07R-nCxlGTFsEA4FLkq9o0C9_9k5D5Ea-qbv"
        
        static let client_credentials = "client_credentials"
    }
}

// FilePath
enum FilePath {
    // Document 目录
    static var documentPath = NSHomeDirectory() + "/Documents"
    // 认证文件
    static let oauthFilePath = documentPath + "/client_credentials_oauth"
    
    
}

enum UniversalString {
    enum keyPath {
        static let estimatedProgress = "estimatedProgress"
        static let title = "title"
    }
}

