//
//  UIBarButtonItem+Addition.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import Foundation
import UIKit


extension UIBarButtonItem{
    
    class func itemWithTarget(target:AnyObject?, action:Selector, image:String) -> UIBarButtonItem {
        
        let item = UIButton(type: .Custom)
        item.setBackgroundImage(UIImage(named: image), forState: .Normal)
        item.setBackgroundImage(UIImage(named: image), forState: .Highlighted)
        item.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        item.frame = CGRectMake(0, 0, 18, 18)
        let barButtonItem = UIBarButtonItem.init(customView: item)
        
        return barButtonItem
    }
    
    class func chai() -> Void {
        print("itemWithTargetChai")
    }
}
