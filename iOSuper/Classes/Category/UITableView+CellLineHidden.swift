//
//  UITableView+CellLineHidden.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/13.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

extension UITableView{
    
    func hideCellLine(hidden : Bool){
        
        if hidden == true {
            let view = UIView()
            view.backgroundColor = UIColor.clearColor()
            self.tableFooterView = view;
        }
    }
}
