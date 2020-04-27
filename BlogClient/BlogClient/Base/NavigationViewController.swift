//
//  NavigationViewController.swift
//  BlogClient
//
//  Created by Long on 2020/4/24.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is MeViewController {
            self.setNavigationBarHidden(true, animated: true)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("sdfasdfasd")
    }
}
