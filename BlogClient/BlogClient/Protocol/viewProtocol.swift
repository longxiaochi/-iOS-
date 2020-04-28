//
//  viewProtocol.swift
//  BlogClient
//
//  Created by LongMac on 2020/4/28.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

protocol InitViewProtocol {
    func InitView()
    func AutoLayoutView()
}

extension InitViewProtocol {
    func setupUI () {
        self.InitView()
        self.AutoLayoutView()
    }
}
