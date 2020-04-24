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
          
        tabBar.barTintColor = UIColor.white
        
        
        
//        let homeViewController = HomeViewController.init()
//        let navigationViewController = NavigationViewController.init(rootViewController: homeViewController)
//        tabBarViewController.addChild(navigationViewController)
    }
    
    func addChild(_ title: String, _ image: String, _ selectedImage: String, _ type: UIViewController.Type) {
        let child = NavigationViewController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.image = UIImage(named: image)
        child.tabBarItem.selectedImage = UIImage(named: selectedImage)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }
}
