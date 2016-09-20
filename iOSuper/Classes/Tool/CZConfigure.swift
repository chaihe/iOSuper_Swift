//
//  CZConfigure.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/20.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit


let kHZBaseUrl = "http://www.henzanapp.com/apppost/"
let kHZBaseShareUrl = "http://www.henzanapp.com/post/"

//微博
let kWeiboAppKey = "3516951659"
let kWeiboAppSecret = "5328dc9afa533c26bc8eb1858680614a"
let kWeiboResirectURI = "http://www.henzanapp.com/oauth/v2/weibo"

//微信
let kWechatAppID = "wx518d244a9f49c3b8"
let kWechatAppSecret = "e9fcd4c3e17054a34577fa8f3e351090"

//QQ开放平台
let kQQConnectAppKey = "101272171"
let kQQConnectAppSecret = "c1af6a551e4f47ae2bda9a45652de49d"

//ShareSDK
let kShareSDKKey = "1135a1c6f499e"

let HZColor = UIColor(red: 243/255, green: 62/255, blue: 62/255, alpha: 1.0)
let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

class CZConfigure: NSObject {
    
    func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
