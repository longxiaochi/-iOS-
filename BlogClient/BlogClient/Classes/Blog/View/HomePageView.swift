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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
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
            requestData()
        }
    }
    
    // request
    func requestData() {
        if (isRequesting) { return }
        isRequesting = true
        HomeService.getHomeBlogInfo(pageSize: 20, pageIndex: 1) { [weak self] (result, status) in
            switch status {
            case .success:
                guard let items = result as? [BlogItem] else { return }
                self?.dataSource = items
                self?.tableView.reloadData()
            case .failure:
                log("fail")
            }
            
            self?.isRequesting = false
        }
    }
}

// MARK: - InitViewProtocol
extension HomePageView: InitViewProtocol {
    func initView() {
        tableView = UITableView.lc.initTableView(frame: CGRect.zero, style: .plain, delegate: self, dataSource: self, separatorStyle: .none, showIndicator: false)
        tableView.register(HomePageViewCell.self, forCellReuseIdentifier: NSStringFromClass(HomePageViewCell.self))
        self.addSubview(tableView)
    }
    
    func autoLayoutView() {
        tableView.mas_makeConstraints { (make) in
            make?.leading.trailing()?.bottom()?.top()?.mas_equalTo()(self)?.offset()(0)
        }
    }
}

// MARK: - UITableViewDelegate
extension HomePageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
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
        return cell
    }
}

