//
//  MeViewController.swift
//  BlogClient
//
//  Created by Long on 2020/4/27.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class MeViewController: UIBaseViewController {

    var tableView: UITableView!
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = R.color.white_FFFFFF()
        self.setupUI()
    }
}

// MARK: - InitViewProtocol
extension MeViewController: InitViewProtocol {
    func InitView() {
        backgroundImage = UIImageView.lc.initImageView(frame: CGRect.init(x: 0, y: 0, width:self.view.lc.width , height: 240), image: R.image.accountBackgroundImage())
        self.view.addSubview(backgroundImage)
        
        tableView = UITableView.lc.initTableView(frame: .zero, style: .plain, delegate: self, dataSource: self, separatorStyle: .none)
        tableView.backgroundColor = UIColor.clear
        tableView.register(R.nib.meTableViewCell)
        
        let tableHeadView = MeTableHeadView(frame: CGRect.init(x: 0, y: 0, width: self.view.lc.width, height: 290))
        tableView.tableHeaderView = tableHeadView
        
        self.view.addSubview(tableView)
    }
    
    func AutoLayoutView() {
        tableView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self.view)?.offset()(0)
        }
    }
}

// MARK: - UITableViewDelegate
extension MeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDataSource
extension MeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.meTableViewCell, for: indexPath)!
        
    
    }
}



