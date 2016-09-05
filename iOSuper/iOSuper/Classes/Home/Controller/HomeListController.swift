//
//  HomeListController.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class HomeListController: UITableViewController {
    
    let identifilerCell = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Homelist"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCellWithIdentifier(identifilerCell)
//        if cell == nil {
//            cell = UITableViewCell.init(style: .Default, reuseIdentifier: identifilerCell)
//        }
//        cell?.textLabel?.text = "第\(indexPath.section)组：\(indexPath.row)行"
//        cell?.backgroundColor = UIColor.redColor()
//        return cell!
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifilerCell) as? HomeListCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HomeListCell", owner: self, options: nil).last as? HomeListCell
        }
        
        cell?.lbPrice.text = "第\(indexPath.row)行"
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let homeSb = UIStoryboard.init(name: "Home", bundle: NSBundle.mainBundle())
        let HomeInfo = homeSb.instantiateViewControllerWithIdentifier("CalculatorController")
    
        self.navigationController?.pushViewController(HomeInfo, animated: true)
        
    }
}
