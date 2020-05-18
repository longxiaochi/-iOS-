//
//  HomeViewController.swift
//  BlogClient
//
//  Created by Long on 2020/4/24.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class HomeViewController: UIBaseViewController {
    var navigationBarView: NavigationBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.white_FFFFFF()
        
        // longxiaochi
        self.setupUI()
        
        
        
    }

}

// MARK: - InitViewProtocol
extension HomeViewController: InitViewProtocol {
    func initView() {
        navigationBarView = NavigationBarView(frame: CGRect.zero)
        navigationBarView.delegate = self
        self.view.addSubview(navigationBarView)
    }
    
    func autoLayoutView() {
        navigationBarView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(self.view)?.offset()(43)
            make?.leading.trailing()?.mas_equalTo()(self.view)?.offset()(0)
            make?.height.mas_equalTo()(44)
        }
    }
}

// MARK: - NavigationBarViewDelegate
extension HomeViewController: NavigationBarViewDelegate {
    func logoAction() {
        // TODO: 处理点击logo
    }
    
    func searchAction() {
        // TODO: 处理点击search
    }
    
    func selectMenuTitleIndex(_ index: Int, itemModel: TabMenuItemProtocol?) {
        // TODO: 点击菜单回调
        
    }
}
