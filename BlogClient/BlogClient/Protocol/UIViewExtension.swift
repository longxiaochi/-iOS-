//
//  UIViewExtension.swift
//  BlogClient
//
//  Created by LongMac on 2020/4/28.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

extension UIView {
    var width: CGFloat {
        self.frame.size.width
    }
    var height: CGFloat {
        self.frame.size.height
    }
    var x: CGFloat {
        self.frame.origin.x
    }
    var y: CGFloat {
        self.frame.origin.y
    }
    var center: CGPoint {
        CGPoint(x: self.x/2, y: self.y/2)
    }
}
