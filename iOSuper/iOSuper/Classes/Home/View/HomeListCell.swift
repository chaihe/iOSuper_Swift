//
//  HomeListCell.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class HomeListCell: UITableViewCell {
    
    @IBOutlet weak var lbPrice: UILabel!
    
    var cellTitle :String?{
        didSet{
          self.lbPrice?.text = cellTitle! + "元"
        }
    }
}