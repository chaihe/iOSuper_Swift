//
//  CZNetWorkTool.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/12.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias NetworkFinished = (success: Bool, result: JSON?, error: NSError?) ->()

class CZNetWorkTool: NSObject {
    
    static let shareNetWorkTool = CZNetWorkTool()
}

extension CZNetWorkTool{ 
    func get(urlString: String, para: [String : AnyObject]?, finished:NetworkFinished){
        
        Alamofire.request(.GET, urlString, parameters: para).responseJSON { (response) -> Void in
            if let data = response.data {
                let json = JSON(data: data)
                if  json["status"].string == "ok"{
                    finished(success: true, result: json, error: nil)
                }
            } else {
                finished(success: false, result: nil, error: response.result.error)
            }
        }
        finished(success: true, result: "CZNetWorkTool_get", error: nil)
    }
}
