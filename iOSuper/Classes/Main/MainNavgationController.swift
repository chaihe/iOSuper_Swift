//
//  MainNavgationController.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class MainNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWithTarget(self, action: #selector(MainNavgationController.back), image: "Assets_Tabbar_Icon_Msg_Selected")
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func back(){
        print("back")
        self.popViewControllerAnimated(true)
    }
}
