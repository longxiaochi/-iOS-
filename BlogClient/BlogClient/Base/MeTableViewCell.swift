//
//  MeTableViewCell.swift
//  BlogClient
//
//  Created by Long on 2020/4/30.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class MeTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell() {
        self.contentView.backgroundColor = R.color.white_FFFFFF()
        iconImage.image = R.image.tabBarItem_flash()
        contentLabel.text = "sdjfalsdjflasd"
        contentLabel.font = R.font.hkGroteskMedium(size: 12)
        contentLabel.textColor = R.color.black_4444()
        arrowIcon.image = R.image.tabBarItem_flash()
    }
    
}
