//
//  CalculatorController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {

    var articleModel : CZArticles?{
        didSet{
            self.addwebView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = "计算结果"
        
        self.getCalculator()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func addwebView(){
        let webView = UIWebView(frame: self.view.bounds)
        webView.loadRequest(NSURLRequest.init(URL: NSURL.init(string: (articleModel?.url)!)!))
        self.view.addSubview(webView)
    }
    
    func getCalculator() {
        
    }
}
