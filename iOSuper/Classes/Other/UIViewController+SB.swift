//
//  UIViewController+SB.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/6.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

enum sbType:String {
    
    case sbTypeMain = "Main"
    case sbTypeHome = "Home"
}

extension UIViewController{
    
    class func initWithSB(sbName:sbType) ->UIViewController{
        
        let sb = UIStoryboard.init(name: sbName.rawValue, bundle: NSBundle.mainBundle())
        let homeController = sb.instantiateViewControllerWithIdentifier("\(self)")
        
        print("deinit: \(object_getClassName(self))")
        
        // 返回应用程序名+类名+内存地址
        
        print("deinit: \(self)")
        
        // 返回应用程序名+类名+内存地址
        
        print("deinit: \(self.description)")
        
        // 返回类名
        
        print("deinit: \(self.dynamicType)")

        return homeController
    }
}