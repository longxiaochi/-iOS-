//
//  HomeService.swift
//  BlogClient
//
//  Created by Long on 2020/5/19.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

class HomeService {
    static func getHomeBlogInfo(pageSize: Int, pageIndex: Int, callBack: @escaping ServiceCompleteBlock) {
        let parameter = [API.rpk.pageIndex : pageIndex, API.rpk.pageSize : pageSize]
        NetworkTool.request(url: API.url.blogpostsSitehome, parameter: parameter) { (response) in
        
            switch response.result {
            case .success(let result):
                log("success")
                
                if let jsonArray = result as? [Any] {
                    let itemModels = jsonArray.kj.modelArray(type: BlogItem.self)
                    callBack(itemModels, .success)
                } else {
                    callBack([], .success)
                }
            case .failure(let error):
                log("fail")
                callBack(error, .success)
            }
        }
    }
}
