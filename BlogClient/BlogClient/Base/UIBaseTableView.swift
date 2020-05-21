//
//  UIBaseTableView.swift
//  BlogClient
//
//  Created by Long on 2020/5/21.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

extension UITableViewDelegate {
    
}

class UIBaseTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, style: UITableView.Style, delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?, separatorStyle: UITableViewCell.SeparatorStyle, showIndicator: Bool) {
        self.init(frame: frame, style: style)
        
        self.delegate = delegate
        self.dataSource = dataSource
        self.separatorStyle = separatorStyle
        self.showsHorizontalScrollIndicator = showIndicator
        self.showsVerticalScrollIndicator = showIndicator
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
    
    func enableRefreshHeader() {
        self.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(headRefreshingAction))
        self.mj_header?.isAutomaticallyChangeAlpha = true
        self.mj_header?.beginRefreshing()
    }
    
    func enableRefreshFooter() {
        self.mj_footer = MJRefreshFooter.init(refreshingTarget: self, refreshingAction: #selector(footerRefreshAction))
    }
    
    @objc func headRefreshingAction() {
        self.refreshRequest { (result) in
            self.mj_header?.endRefreshing()
        }
    }
    
    @objc func footerRefreshAction() {
        self.loadMoreRequest { (result) in
            self.mj_footer?.endRefreshing()
        }
    }
    
    func refreshRequest(callBack: (Bool) -> ()) {
        //rewrite subclass
    }
    
    func loadMoreRequest(callBack: (Bool) -> ()) {
        //rewrite subclass
    }
}
