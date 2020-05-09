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
        avatarImage.image = R.image.accountAvatar()
        avatarImage.backgroundColor = R.color.white_FFFFFF()
        
        userNameLable.font = R.font.hkGroteskBold(size: 14)
        userNameLable.textColor = R.color.white_FFFFFF()
        signLable.font = R.font.hkGroteskMedium(size: 12)
        signLable.textColor = R.color.white_FFFFFF()
        
        middleView.backgroundColor = R.color.white_FFFFFF()
        middleView.lc.addShadow(shadowColor:R.color.black_000000_14(), shadowOffset: CGSize.zero, shadowOpacity: 1, shadowRadius: 5, viewCornerRadius: 10)
        
        blogItemIcon.image = R.image.accountBlog()
        blogItemLablel.text = R.string.localizable.myBlogs()
        blogItemLablel.textColor = R.color.black_4444()
        blogItemLablel.font = R.font.hkGroteskMedium(size: 12)
        essayItemIcon.image = R.image.accountEssay()
        essayItemLabel.text = R.string.localizable.essay()
        essayItemLabel.font = R.font.hkGroteskMedium(size: 12)
        essayItemLabel.textColor = R.color.black_4444()
        
        faveItemIcon.image = R.image.accountFave()
        faveItemLabel.text =  R.string.localizable.fave()
        faveItemLabel.font = R.font.hkGroteskMedium(size: 12)
        faveItemLabel.textColor = R.color.black_4444()
    }
}


