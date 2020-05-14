//
//  String+Lc.swift
//  BlogClient
//
//  Created by Long on 2020/4/29.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

extension String: LCCompatible {}
extension NSString: LCCompatible {}
extension LC where Base: ExpressibleByStringLiteral {
    var numberCount: Int {
        let string = base as! String
        var count = 0
        for n in string where ("0"..."9").contains(n) {
            count += 1
        }
        return count
    }
    
    func urlParameterValue(_ parameter: String) -> String? {
        let url = base as! NSString
        let paras = url.components(separatedBy: "&") as NSArray
        
        let target = paras.filter { (element) -> Bool in
            let ele = element as! NSString
            return ele.contains("\(parameter)=")
        }
        
        if target.count <= 0 {
            return nil
        }
        
        let str = target.first as! NSString
        let range = str.range(of: "\(parameter)=", options: .caseInsensitive)
        if range.location == NSNotFound {
            return nil
        }
        
        let value = str.substring(with: NSRange(location: range.location + range.length, length: str.length - (range.location + range.length)))
        return value
    }
}
