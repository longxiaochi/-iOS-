//
//  StoreHandler.swift
//  BlogClient
//
//  Created by Long on 2020/5/14.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

struct StoreHelper {
    
    // 保存数据到UserDefault、重置数据
    static func storeValue(_ value: Any?, forKey: String) -> Void {
        let key = "\(kAppBundleIdentifier)+.\(forKey)"
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    // 读取UserDefault数据
    static func valueForKey(_ key: String) -> Any? {
        let realKey = "\(kAppBundleIdentifier)+.\(key)"
        return UserDefaults.standard.value(forKey: realKey)
    }
    
    // keychain 相关
    
    
}
