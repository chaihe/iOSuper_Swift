//
//  UIViewController+SB.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/6.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

enum sbType:String {
    
    case sbTypeMain         = "Main"
    case sbTypeHome         = "Home"
    case sbTypeEditPic      = "EditPic"
}

extension UIViewController{
    
    class func initWithSB(sbName:sbType) ->UIViewController{
        
        let sb = UIStoryboard.init(name: sbName.rawValue, bundle: NSBundle.mainBundle())
        let homeController = sb.instantiateViewControllerWithIdentifier("\(self)")
        return homeController
    }
}
