//
//  HomePageViewCell.swift
//  BlogClient
//
//  Created by LongMac on 2020/5/19.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class HomePageViewCell: UITableViewCell {
    var headView: HomePageViewCellHeadView!
    var titleLabel: UILabel!
    var desLabel: UILabel!
    var bottomView: HomePageViewCellBottomView!
    var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.selectionStyle = .none
    }
}

// MARK: Public Method
extension HomePageViewCell {
    func configCell(withItemModel model: BlogItem) {
        headView.configHeadView(avatarUrl: model.avatar, blogName: model.blogName, postTime: Date.lc.timeAgoWithDate(model.postDate))
        titleLabel.text = model.title
        desLabel.text = model.description
        bottomView.configBottomView(withFave: model.diggCount, comments: model.commentCount, views: model.viewCount)
    }
}

extension HomePageViewCell: InitViewProtocol {
    func initView() {
        headView = HomePageViewCellHeadView(frame: CGRect.zero)
        contentView.addSubview(headView)
        
        titleLabel = UILabel.lc.initLable(frame: CGRect.zero, title: "", textColor: R.color.black_444444(), font: R.font.stHeitiSCMedium(size: 17), numberOfLines: 2)
        contentView.addSubview(titleLabel)
        desLabel = UILabel.lc.initLable(frame: CGRect.zero, title: "", textColor: R.color.black_444444(), font: R.font.stHeitiSCLight(size: 15), numberOfLines: 3)
        contentView.addSubview(desLabel)
        
        bottomView = HomePageViewCellBottomView(frame: CGRect.zero)
        contentView.addSubview(bottomView)
        
        bottomLineView = UIView()
        bottomLineView.backgroundColor = R.color.gray_F1F3F2()
        contentView.addSubview(bottomLineView)
    }
    
    func autoLayoutView() {
        headView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(contentView)?.offset()(10)
            make?.leading.trailing().mas_equalTo()(contentView)?.offset()(0)
        }
        
        titleLabel.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(headView.mas_bottom)?.offset()(10)
            make?.trailing.mas_equalTo()(contentView)?.offset()(-15)
            make?.leading.mas_equalTo()(contentView)?.offset()(15)
        }
        
        desLabel.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(titleLabel.mas_bottom)?.offset()(5)
            make?.trailing.mas_equalTo()(contentView)?.offset()(-15)
            make?.leading.mas_equalTo()(contentView)?.offset()(15)
        }
        
        bottomView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(desLabel.mas_bottom)?.offset()(20)
            make?.leading.mas_equalTo()(contentView)?.offset()(15)
            make?.trailing.mas_equalTo()(contentView)?.offset()(-15)
        }
        
        bottomLineView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(bottomView.mas_bottom)?.offset()(15)
            make?.leading.trailing()?.bottom()?.mas_equalTo()(contentView)?.offset()(0)
            make?.height.mas_equalTo()(0.5)
        }
    }
}




