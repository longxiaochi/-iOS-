//
//  NavigationBarView.swift
//  BlogClient
//
//  Created by Long on 2020/5/18.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

@objc protocol NavigationBarViewDelegate: NSObjectProtocol {
    @objc func logoAction()
    @objc func searchAction()
    @objc func selectMenuTitleIndex(_ index: Int, itemModel: TabMenuItemProtocol?) -> Void
}

class NavigationBarView: UIBaseView {
    weak var delegate: NavigationBarViewDelegate?
    
    var leftIcon: UIImageView!
    var tabMenuView: TabMenuView!
    var rightIcon: UIImageView!
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Method
extension NavigationBarView {
    func loadTabMenu(_ datas: [TabMenuItemProtocol]) {
        tabMenuView.loadTabMenu(datas: datas, selectedIndex: 0)
    }
}

// MARK: - InitViewProtocol
extension NavigationBarView: InitViewProtocol {
    func initView() {
        leftIcon = UIImageView.lc.initImageView(frame: CGRect.zero, image: R.image.logo())
        leftIcon.lc.addTapGesture(target: self, action: #selector(selectLogo))
        self.addSubview(leftIcon)
        
        tabMenuView = TabMenuView()
        tabMenuView.delegate = self
        self.addSubview(tabMenuView)
        
        rightIcon = UIImageView.lc.initImageView(frame: CGRect.zero, image: R.image.search())
        rightIcon.lc.addTapGesture(target: self, action: #selector(selectSearch))
        self.addSubview(rightIcon)
    }
    
    func autoLayoutView() {
        leftIcon.mas_makeConstraints { (make) in
            make?.leading.mas_equalTo()(self)?.offset()(15)
            make?.centerY.mas_equalTo()(self.mas_centerY)?.offset()(0)
            make?.size.mas_equalTo()(CGSize(width: 18, height: 18))
        }
        
        tabMenuView.mas_makeConstraints { (make) in
            make?.leading.mas_equalTo()(self.leftIcon.mas_trailing)?.offset()(0)
            make?.trailing.mas_equalTo()(self.rightIcon.mas_leading)?.offset()(-15)
            make?.top.bottom()?.mas_equalTo()(self)?.offset()(0)
        }
        
        rightIcon.mas_makeConstraints { (make) in
            make?.trailing.mas_equalTo()(self)?.offset()(-15)
            make?.centerY.mas_equalTo()(self.mas_centerY)?.offset()(0)
            make?.size.mas_equalTo()(CGSize(width: 20, height: 20))
        }
    }
}

// MARK: - TabMenuViewDelegate
extension NavigationBarView: TabMenuViewDelegate {
    func selectMenuTitleIndex(_ index: Int, itemModel: TabMenuItemProtocol?) {
        if let _ = delegate?.responds(to: #selector(delegate?.selectMenuTitleIndex(_:itemModel:))) {
            delegate?.selectMenuTitleIndex(index, itemModel: itemModel)
        }
    }
}

// MARK: - Action
extension NavigationBarView {
    @objc func selectLogo() {
        if let _ = delegate?.responds(to: #selector(delegate?.logoAction)) {
            delegate?.logoAction()
        }
    }
    
    @objc func selectSearch() {
        if let _ = delegate?.responds(to: #selector(delegate?.searchAction)) {
            delegate?.searchAction()
        }
    }
}
