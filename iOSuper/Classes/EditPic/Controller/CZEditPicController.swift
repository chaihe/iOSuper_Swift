//
//  CZEditPicController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/19.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CZEditPicController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "编辑图片"

        self.edgesForExtendedLayout = .None
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setHeadView()
    }
    
    func setHeadView(){
    
        
        let headView = UIView(frame: CGRectMake(0, 0, 375, 64))
        headView.backgroundColor = CZColor
        self.view.addSubview(headView)
    }
}
