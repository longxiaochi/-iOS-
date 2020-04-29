//
//  UIScrollViewExtension.swift
//  BlogClient
//
//  Created by Long on 2020/4/28.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

extension UIScrollView {
    convenience init(frame: CGRect, delegate: UIScrollViewDelegate, showIndicator: Bool) {
        self.init(frame: frame)
        self.showsVerticalScrollIndicator = showIndicator
        self.showsHorizontalScrollIndicator = showIndicator
        self.delegate = delegate
        if #available(iOS 11, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
