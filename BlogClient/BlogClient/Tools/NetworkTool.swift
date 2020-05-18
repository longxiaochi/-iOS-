//
//  NetworkTool.swift
//  BlogClient
//
//  Created by Long on 2020/5/11.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

class NetworkTool {
    public static func request(url: URLConvertible, method: HTTPMethod = .get, parameter: Parameters?, callBack: @escaping (AFDataResponse<Any>) -> Void) {
        // 每次请求都需要判断当前是否存在token，并判断有效期
        if (OAuth.isLocalExistOauthData() && !OAuth.isAccessTokenExpired()) {
            guard let model: OAuth = KakaJSON.read(OAuth.self, from: FilePath.oauthFilePath) else { return }
            let header = HTTPHeader.authorization(bearerToken: model.accessToken)
            AF.request(url, method: method, parameters: parameter, headers: HTTPHeaders([header])).responseJSON { response in
                callBack(response)
            }
        } else {
            let authHeader = HTTPHeader.authorization(username: API.rpv.client_id, password: API.rpv.client_secret)
            AF.request(API.url.connectToken, method: .post, parameters: [API.rpk.grant_type : API.rpv.client_credentials], headers: HTTPHeaders([authHeader])).responseJSON { response in
                
                guard let dict = response.value else { return callBack(response) }
                let jsons = SwiftyJSON.JSON(dict).dictionaryValue
                let model: OAuth = KakaJSON.model(from: jsons, OAuth.self)
                KakaJSON.write(model, to: FilePath.oauthFilePath)
                
                // 先获取授权数据， 然后才能正常请求数据
                let requestHeader = HTTPHeader.authorization(bearerToken: model.accessToken)
                AF.request(url, method: method, parameters: parameter, headers: HTTPHeaders([requestHeader])).responseJSON { response in
                    callBack(response)
                }
            }
        }
    }
}

