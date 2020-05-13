//
//  MethodMacros.swift
//  BlogClient
//
//  Created by Long on 2020/5/9.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

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



