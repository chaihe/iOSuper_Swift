//
//  CZConfigure.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/20.
//  Copyright © 2016年 Chai. All rights reserved.
//

import Foundation
import UIKit

let CZColor = UIColor(red: 100/255, green: 150/255, blue: 160/255, alpha: 1.0)
let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

//RGB转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    //
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}
