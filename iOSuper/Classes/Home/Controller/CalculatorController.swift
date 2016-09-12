//
//  CalculatorController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "计算结果"
        
        self.getCalculator()
    }
    
    func getCalculator() {
        
        let para = ["userName" : "chaizhi",
                    "age"      : "18"]
        
        
        CZNetWorkTool.shareNetWorkTool.get("http://localhost:8888/api/get_recent_posts/", para: nil) { (success, result, error) in
        
            if success{
                print(result!)
            }else{
                print(result)
            }
        }
    }
}
