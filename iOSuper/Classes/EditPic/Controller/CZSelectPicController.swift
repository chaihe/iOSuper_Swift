//
//  CZSelectPicController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/20.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CZSelectPicController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnSelectPicClick(sender: AnyObject) {
        
        print("btnSelectPic")
        
        let editPic = CZEditPicController()
        
        self.presentViewController(editPic, animated: true, completion: nil)
        
    }
}
