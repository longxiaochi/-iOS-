//
//  MethodMacros.swift
//  BlogClient
//
//  Created by Long on 2020/5/9.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

let kAppBundleIdentifier = Bundle.main.bundleIdentifier ?? ""
let kStatusBarHeight: CGFloat = isIphoneX() ? 44 : 20
let kNavigationBarHeight: CGFloat = isIphoneX() ? 88 : 64

// MARK: - Log
func log<T>(_ msg: T, file: NSString = #file, line: Int = #line, fn: String = #function) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
    print(prefix, msg)
    #endif
}

// MARK: - Array
func isArray(_ value: Any) -> Bool {
    value is [Any]
}

func isArrayType(_ type: Any.Type) -> Bool {
    type is ArrayType.Type
}

// MARK: - 机型判断
func isIphoneX() -> Bool {
    if UIDevice().userInterfaceIdiom == .phone {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height

        let maxLength = screenWidth > screenHeight ? screenWidth : screenHeight
        if maxLength == 812.0 || maxLength == 896.0 {
            return true
        }
    }
    return false
}

func isIphone6() -> Bool {
    if UIDevice().userInterfaceIdiom == .phone {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height

        let maxLength = screenWidth > screenHeight ? screenWidth : screenHeight
        if maxLength == 667.0 {
            return true
        }
    }
    return false
}

func isIphone6P() -> Bool {
    if UIDevice().userInterfaceIdiom == .phone {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height

        let maxLength = screenWidth > screenHeight ? screenWidth : screenHeight
        if maxLength == 736.0 {
            return true
        }
    }
    return false
}



