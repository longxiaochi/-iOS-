//
//  HomePageView.swift
//  BlogClient
//
//  Created by Long on 2020/5/19.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class HomePageView: PageView {
    var tableView: UITableView!
    var dataSource: [BlogItem] = [BlogItem]()
    var isRequesting: Bool = false
    var curIndex: Int = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        tableView.lc.enableRefreshHeader()
        tableView.lc.enableRefreshFooter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Method
extension HomePageView {
    // load data
    func loadPageData() {
        if dataSource.count == 0  {
            requestData(isLoadMore: false) { _ in }
        }
    }
}

// MARK: - Request
extension HomePageView {
    // request
    func requestData(isLoadMore: Bool, callBack: @escaping CallBack) {
        if (isRequesting) {
            return callBack(false)
        }
        isRequesting = true
        let pageIndex = isLoadMore ? curIndex : 1
        HomeService.getHomeBlogInfo(pageSize: 20, pageIndex: pageIndex) { [weak self] (result, status) in
            switch status {
            case .success:
                guard let items = result as? [BlogItem] else { return callBack(false) }
                if isLoadMore {
                    self?.dataSource.append(contentsOf: items)
                    self?.curIndex += 1
                } else {
                    self?.dataSource.removeAll()
                    self?.dataSource = items
                    self?.curIndex = 1
                }
                
                self?.tableView.reloadData()
                callBack(true)
            case .failure:
                log("fail")
                callBack(false)
            }
            
            self?.isRequesting = false
        }
    }
}


// MARK: - InitViewProtocol
extension HomePageView: InitViewProtocol {
    func initView() {
        tableView = UITableView.lc.initTableView(frame: CGRect.zero, style: .plain, delegate: self, dataSource: self, separatorStyle: .none, showIndicator: true)
        tableView.refreshDelegate = self
        tableView.register(HomePageViewCell.self, forCellReuseIdentifier: NSStringFromClass(HomePageViewCell.self))
        self.addSubview(tableView)
    }
    
    func autoLayoutView() {
        tableView.mas_makeConstraints { (make) in
            make?.leading.trailing()?.bottom()?.top()?.mas_equalTo()(self)?.offset()(0)
        }
    }
}

// MARK: - RefreshDelegate
extension HomePageView: RefreshDelegate {
    // 下拉加载
    func refreshRequest(callBack: @escaping CallBack) {
        requestData(isLoadMore: false, callBack: callBack)
    }
    
    // 下拉加载
    func loadMoreRequest(callBack: @escaping CallBack) {
        requestData(isLoadMore: true, callBack: callBack)
    }
}

// MARK: - UITableViewDelegate
extension HomePageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let itemModel = dataSource.lc.objectAtIndex(indexPath.row) as? BlogItem else { return 0 }
        return HomePageViewCell.cellHeight(itemModel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemModel = dataSource.lc.objectAtIndex(indexPath.row) as? BlogItem else { return }
        
//        let wkWebView = WKWebViewController(url: itemModel.url)
    }
}

// MARK: - UITableViewDataSource
extension HomePageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemModel = dataSource.lc.objectAtIndex(indexPath.row) as? BlogItem else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomePageViewCell.self), for: indexPath) as? HomePageViewCell else { return UITableViewCell() }
        cell.configCell(withItemModel: itemModel)
        cell.delegate = self
        return cell
    }
}

// MARK: - HomePageViewCellDelegate
extension HomePageView: HomePageViewCellDelegate {
    func faveAction() {
        log("faveAction")
    }
    
    func commentAction() {
        log("commentAction")
    }
    
    func lookAction() {
        log("lookAction")
    }
    
    func avatarAction() {
        log("avatarAction")
    }
}
