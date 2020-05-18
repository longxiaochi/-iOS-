//
//  UserService.swift
//  BlogClient
//
//  Created by LongMac on 2020/5/16.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

enum RequestStatus: Int {
    case failure = 0
    case success = 1
}

typealias ServiceCompleteBlock = (Any, RequestStatus) -> Void

class UserService {
    static func getUserInfo(callBack: @escaping ServiceCompleteBlock) {
        NetworkTool.request(url: API.url.apiUsers, method: .get, parameter: nil) { (response) in
            switch response.result {
            case .success(let json):
                let dic = SwiftyJSON.JSON(json).dictionaryValue
                let user: User = KakaJSON.model(from: dic, User.self)
                callBack(user, .success)
            case .failure(let error):
                callBack(error, .failure)
            }
        }
    }
}
