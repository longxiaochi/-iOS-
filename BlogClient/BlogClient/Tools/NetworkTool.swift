//
//  NetworkTool.swift
//  BlogClient
//
//  Created by Long on 2020/5/11.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

class NetworkTool {
    public static func sendGetRequest(url: URLConvertible, parameter: Parameters?, callBack: @escaping (AFDataResponse<Any>) -> Void) {
        // 每次请求都需要判断当前是否存在token，并判断有效期
        let header = HTTPHeader.authorization(username: API.rpv.client_id, password: API.rpv.client_secret)
        AF.request(API.url.connectToken, method: .post, parameters: [API.rpk.grant_type : API.rpv.client_credentials], headers: HTTPHeaders([header])).responseJSON { response in
        
            guard let dict = response.value else { return }
            let jsons = SwiftyJSON.JSON(dict).dictionaryValue
            let model: OAuth = KakaJSON.model(from: jsons, OAuth.self)

//            guard let auth = try? NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: true) else { return }
//            guard let _ = try? auth.write(to: URL(fileURLWithPath: FilePath.oauthFilePath), options: .atomicWrite) else { return }
            
            let result = FileHandler.shareInstance.storeData(model, to: FilePath.oauthFilePath)
            if !result {
                log("文件存储失败")
            }

//            guard let data = try? Data(contentsOf: URL(fileURLWithPath: FilePath.oauthFilePath)) else { return }
            guard let data = FileHandler.shareInstance.readData(from: FilePath.oauthFilePath) else { return }
            guard let tempModel = try? NSKeyedUnarchiver.unarchivedObject(ofClass: OAuth.self, from: data) else { return }

            print(tempModel)
            
            
        }
        
        
        
        
//       let header = HTTPHeader.authorization(bearerToken: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjlFMjcyMkFGM0IzRTFDNzU5RTI3NEFBRDI5NDFBNzg1MDlCMDc2RDAiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJuaWNpcnpzLUhIV2VKMHF0S1VHbmhRbXdkdEEifQ.eyJuYmYiOjE1ODkxNjY0NTQsImV4cCI6MTU4OTI1Mjg1NCwiaXNzIjoiaHR0cDovL29wZW5hcGlfb2F1dGgtc2VydmVyIiwiYXVkIjpbImh0dHA6Ly9vcGVuYXBpX29hdXRoLXNlcnZlci9yZXNvdXJjZXMiLCJDbkJsb2dzQXBpIl0sImNsaWVudF9pZCI6ImYxMmY3Mjc2LWYwOWQtNDk3OS05Mjg4LTZiYTcxYjMwM2ZiNiIsInNjb3BlIjpbIkNuQmxvZ3NBcGkiXX0.FU7It03C4tOCqc0qS7NmVDrJidtYCvQW83TUzOAsfQhXNWT3nsFdUsK2rVfYpZoBFYETzVwCSsoHLE416XQ8RnoXY7vObek6sWoDCXC6-FumDKdnC01kBSRGXcqO124oHxRnoSAQY55TTXf6X-pNxctMholDZPr-Ofrcg1saxdJwOCZL_Piyvrdu2uFn9pU3AHwv3gE77b_hP05REJzTUXPM9VGiS_WPHOyQE2h5H15OqMR0Jw0P2NB-miugGplLfd8A5JO_dEIe3_F7to7stmWNKKB2Vxt-FO2DqS9YTqUosSiIgjHxrpuxX4aw0X0YSZ8XDLqEc3oUk1hSIcI4ZA")
//        AF.request(url, method: .get, parameters: parameter, headers: HTTPHeaders([header])).responseJSON { response in
//            callBack(response)
//        }
    }
    
    
    
    
}

