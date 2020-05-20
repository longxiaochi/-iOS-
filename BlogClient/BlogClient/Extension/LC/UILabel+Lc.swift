//
//  UILabel+Lc.swift
//  BlogClient
//
//  Created by LongMac on 2020/5/19.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

extension UILabel: LCCompatible {}
extension LC: LCCompatible where Base: UILabel {
    static func initLable(frame: CGRect, title: String = "", textColor: UIColor?, font: UIFont?, numberOfLines: Int = 1) -> UILabel {
        let label: UILabel = UILabel(frame: frame)
        label.text = title
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
    }
}
