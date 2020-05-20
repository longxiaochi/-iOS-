//
//  HomePageViewCellBottomView.swift
//  BlogClient
//
//  Created by Long on 2020/5/20.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class HomePageViewCellBottomView: UIBaseView {
    var faveView: IconLabelView!  // 收藏
    var commentView: IconLabelView!   // 评论
    var lookView: IconLabelView!  // 浏览
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBottomView(withFave faves: Int, comments: Int, views: Int) {
        faveView.configView(withIcon: R.image.fave(), text: "\(faves)")
        commentView.configView(withIcon: R.image.comment(), text: "\(comments)")
        lookView.configView(withIcon: R.image.views(), text: "\(views)")
    }
}

extension HomePageViewCellBottomView: InitViewProtocol {
    func initView() {
        faveView = IconLabelView(frame: CGRect.zero)
        self.addSubview(faveView)
        
        commentView = IconLabelView(frame: CGRect.zero)
        self.addSubview(commentView)
    
        lookView = IconLabelView(frame: CGRect.zero)
        self.addSubview(lookView)
    }
    
    func autoLayoutView() {
        faveView.mas_makeConstraints { (make) in
            make?.leading.top().bottom().mas_equalTo()(self)?.offset()(0)
            make?.height.mas_equalTo()(20)
        }
        
        commentView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.mas_centerX)
            make?.centerY.mas_equalTo()(self.mas_centerY)?.offset()(0)
            make?.height.mas_equalTo()(20)
        }
        
        lookView.mas_makeConstraints { (make) in
            make?.trailing.mas_equalTo()(self)?.offset()(0)
            make?.centerY.mas_equalTo()(self.mas_centerY)?.offset()(0)
            make?.height.mas_equalTo()(20)
        }
    }
}




