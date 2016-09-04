//
//  HomeListCell.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class HomeListCell: UITableViewCell {
    
    var cellTitle :String?{
        didSet{
          self.textLabel?.text = cellTitle
        }
    }
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, title:String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}