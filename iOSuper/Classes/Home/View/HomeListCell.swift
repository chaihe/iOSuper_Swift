//
//  HomeListCell.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit
import YYWebImage

class HomeListCell: UITableViewCell {
    
    @IBOutlet weak var lbTltle:     UILabel!
    @IBOutlet weak var lbTimer:     UILabel!
    @IBOutlet weak var lbContent:   UILabel!
    @IBOutlet weak var imgIcon:     UIImageView!
    
    var cellTitle : String?{
        didSet{
//          self.lbPrice?.text = cellTitle! + "元"
        }
    }
    
    var articles : CZArticles?{
        didSet{
            self.lbTimer.text   = articles?.date
            self.lbTltle.text   = articles?.title
            
            let htmlText = (articles?.content)!
            do{
                let attrStr = try NSAttributedString(data: htmlText.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                
                self.lbContent.attributedText = attrStr
            }catch let error as NSError {
                print(error.localizedDescription)
            }
            self.imgIcon.yy_imageURL = NSURL(string: (articles?.thumbnail_images)!)
        }
    }
}