//
//  HomePageViewCell.swift
//  BlogClient
//
//  Created by LongMac on 2020/5/19.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class HomePageViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
    }
}

extension HomePageViewCell: InitViewProtocol {
    func initView() {
        
    }
    
    func autoLayoutView() {
        
    }
}

class HomePageViewCellHeadView: UIBaseView {
    var avatarView: UIImageView!
    var blogNameLabel: UILabel!
    var postTimeLabel: UILabel!
    var leftIconView: UIImageView!
    var nameAndTimeView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension HomePageViewCellHeadView: InitViewProtocol {
    func initView() {
        avatarView = UIImageView.lc.initImageView(frame: CGRect.zero, image: R.image.accountBlog())
        self.addSubview(avatarView)
        
//        blogNameLabel = UILabel
    }
    
    func autoLayoutView() {
        
    }
}


