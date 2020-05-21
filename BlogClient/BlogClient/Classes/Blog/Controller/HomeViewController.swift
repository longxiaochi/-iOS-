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
    var scrollPageView: ScrollPageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.white_FFFFFF()
        
        // longxiaochi
        self.setupUI()
        navigationBarView.loadTabMenu(tabMenu())
        scrollPageView.loadPage(tabMenu())
    }
    
    func tabMenu() -> [TabMenuItem] {
        [TabMenuItem("博客"), TabMenuItem("最新"), TabMenuItem("最近")]
    }
}

// MARK: - InitViewProtocol
extension HomeViewController: InitViewProtocol {
    func initView() {
        navigationBarView = NavigationBarView(frame: CGRect.zero)
        navigationBarView.delegate = self
        self.view.addSubview(navigationBarView)
        
        scrollPageView = ScrollPageView(frame: CGRect.zero)
        scrollPageView.delegate = self
        self.view.addSubview(scrollPageView)
    }
    
    func autoLayoutView() {
        navigationBarView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(self.view)?.offset()(kStatusBarHeight)
            make?.leading.trailing()?.mas_equalTo()(self.view)?.offset()(0)
            make?.height.mas_equalTo()(44)
        }
        
        scrollPageView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(navigationBarView.mas_bottom)?.offset()(0)
            make?.leading.trailing()?.mas_equalTo()(self.view)?.offset()(0)
            make?.bottom.mas_equalTo()(self.view)?.offset()(-kBottomTabBarHeight)
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

extension HomeViewController: UIScrollViewDelegate {
    
}

extension HomeViewController: ScrollPageViewDelegate {
    func pageScrollView(_ scrollView: ScrollPageView, pageViewForIndex index: Int) -> PageView {
        if index == 0 {
            return HomePageView()
        }
        return PageView()
    }
    
    func pageScrollview(_ scrollView: ScrollPageView, loadDataForPageView pageView: PageView, index: Int) {
        if let homePageView = pageView as? HomePageView {
            homePageView.loadPageData()
        }
    }
}
