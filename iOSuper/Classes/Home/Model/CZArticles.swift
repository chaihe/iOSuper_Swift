//
//  CZArticles.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/13.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CZArticles: NSObject {
    
    var title           : String?
    
    var content         : String?
    
    var date            : String?
    
    var url             : String?
    
    var thumbnail_images      : String?

    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}

class thumbnail_imagess: NSObject {
    
    var full            : [String : AnyObject]?
    
    var medium          : [String : AnyObject]?
    
    var medium_large    : [String : AnyObject]?
    
    var large           : [String : AnyObject]?
    
    
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
