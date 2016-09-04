//
//  MainTabbarController.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeListController(), title: "首页", iamge: "Assets_Tabbar_Icon_Home")
    }
    
    func addChildViewController(childController: UIViewController,title: String, iamge:String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: iamge)
        childController.tabBarItem.selectedImage = UIImage(named: iamge + "_Selected")
        
        let navController = MainNavgationController.init(rootViewController: childController)
        addChildViewController(navController)
    }
}
