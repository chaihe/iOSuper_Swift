//
//  AppDelegate.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootNav : MainNavgationController?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        self.setAppStyle()
        
        self.setAppRootController()
        
        return true
    }
    
    func setAppStyle() {
        UINavigationBar.appearance().translucent = true
        UITabBar.appearance().tintColor = UIColor.grayColor()
        UINavigationBar.appearance().tintColor = UIColor.grayColor()
    }
    
    func setAppRootController() {
        rootNav = MainNavgationController(rootViewController: MainTabbarController())
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = rootNav
        self.window?.makeKeyAndVisible()
    }
}

