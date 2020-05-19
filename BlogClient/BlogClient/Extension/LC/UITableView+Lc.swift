//
//  UITableView+Lc.swift
//  BlogClient
//
//  Created by Long on 2020/4/30.
//  Copyright © 2020 LongMac. All rights reserved.
//

import Foundation

extension LC where Base: UITableView {
    static func initTableView(frame: CGRect, style: UITableView.Style, delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?, separatorStyle: UITableViewCell.SeparatorStyle, showIndicator: Bool) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.separatorStyle = separatorStyle
        tableView.showsHorizontalScrollIndicator = showIndicator
        tableView.showsVerticalScrollIndicator = showIndicator
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        return tableView
    }
}
