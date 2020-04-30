//
//  MeTableHeadView.swift
//  BlogClient
//
//  Created by Long on 2020/4/30.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class MeTableHeadView: UIBaseView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var signLable: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var blogItemIcon: UIImageView!
    @IBOutlet weak var blogItemLablel: UILabel!
    @IBOutlet weak var essayItemIcon: UIImageView!
    @IBOutlet weak var essayItemLabel: UILabel!
    @IBOutlet weak var faveItemIcon: UIImageView!
    @IBOutlet weak var faveItemLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = Bundle.main.loadNibNamed(R.nib.meTableHeadView.name, owner: self, options: nil)?.last as? UIView
        contentView.frame = frame
        contentView.backgroundColor = UIColor.clear
        addSubview(contentView)
        
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configUI() {
        avatarImage.lc.addBorderAndCorner(borderWidth: 2.0, borderColor: R.color.white_FFFFFF() ?? UIColor.white, radius: 30)
        avatarImage.image = R.image.tabBarItem_blog_selected()
        
        userNameLable.font = R.font.hkGroteskBold(size: 14)
        userNameLable.textColor = R.color.white_FFFFFF()
        signLable.font = R.font.hkGroteskMedium(size: 12)
        signLable.textColor = R.color.white_FFFFFF()
        
        middleView.backgroundColor = R.color.white_FFFFFF()
        middleView.lc.addCorner(10)
        
        blogItemIcon.image = R.image.tabBarItem_blog()
        blogItemLablel.text = "博客"
        blogItemLablel.font = R.font.hkGroteskMedium(size: 12)
        blogItemLablel.textColor = R.color.black_4444()
        
        essayItemIcon.image = R.image.tabBarItem_blog()
        essayItemLabel.text = "随笔"
        essayItemLabel.font = R.font.hkGroteskMedium(size: 12)
        essayItemLabel.textColor = R.color.black_4444()
        
        faveItemIcon.image = R.image.tabBarItem_blog()
        faveItemLabel.text = "收藏"
        faveItemLabel.font = R.font.hkGroteskMedium(size: 12)
        faveItemLabel.textColor = R.color.black_4444()
    }
}


