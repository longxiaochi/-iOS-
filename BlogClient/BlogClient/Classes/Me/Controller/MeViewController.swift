//
//  MeViewController.swift
//  BlogClient
//
//  Created by Long on 2020/4/27.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class MeViewController: UIBaseViewController, InitViewProtocol, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        self.setupUI()
    }
    
    func InitView() {
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = scrollView.showsHorizontalScrollIndicator == false;
        scrollView.delegate = self
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false;
        self.view.addSubview(scrollView)

        backgroundImage = UIImageView(frame: CGRect.init(x: 0, y: 0, width:self.view.width , height: 265))
        backgroundImage.image = R.image.accountBackgroundImage()
        self.view.addSubview(backgroundImage)
    }
    
    func AutoLayoutView() {
        scrollView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self.view)?.offset()(0)
        }
    }
}
