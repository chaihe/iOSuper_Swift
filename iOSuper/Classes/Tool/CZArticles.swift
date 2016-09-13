//
//  CZArticles.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/13.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CZArticles: NSObject {
    
    var title   : String?
    
    var content : String?
    
    var date    : String?
    
    var url     : String?
    
    

    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
