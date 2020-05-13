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
}
