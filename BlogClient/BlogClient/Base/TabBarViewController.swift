//
//  TabBarViewController.swift
//  BlogClient
//
//  Created by Long on 2020/4/24.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(R.string.localizable.blog(), R.image.tabBarItem_blog(), R.image.tabBarItem_blog_selected(), HomeViewController.self)
        addChild(R.string.localizable.news(), R.image.tabBarItem_news(), R.image.tabBarItem_news_selected(), NewsViewController.self)
        addChild(R.string.localizable.flash(), R.image.tabBarItem_flash(), R.image.tabBarItem_flash_selected(), FlashViewController.self)
        addChild(R.string.localizable.library(), R.image.tabBarItem_liberary(), R.image.tabBarItem_liberary_selected(), LibraryViewController.self)
        addChild(R.string.localizable.me(), R.image.tabBarItem_me(), R.image.tabBarItem_me_selected(), MeViewController.self)
    }
    
    func addChild(_ title: String, _ image: UIImage?, _ selectedImage: UIImage?, _ type: UIViewController.Type) {
        let child = NavigationViewController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.image = image
        child.tabBarItem.selectedImage = selectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.red_F15A43()], for: .selected)
        self.addChild(child);
    }
}
