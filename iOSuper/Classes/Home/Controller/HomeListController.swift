//
//  HomeListController.swift
//  iOSuper
//
//  Created by Chai on 16/9/5.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit
import MJRefresh
    
class HomeListController: UITableViewController {
    
    let cellHieght : CGFloat = 133.0
    let identifilerCell = "cellId"
    var articleList = [CZArticles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.hideCellLine(true)
    
        self.navigationItem.title = "Homelist"

        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.loadArticles()
        })
        tableView.mj_header.beginRefreshing()
    }
    
    func loadArticles() {
    
        
        CZNetWorkTool.shareNetWorkTool.get("http://10.0.0.246:8888/api/get_recent_posts/", para: nil) { (success, result, error) in
            
            if success == true{
                if let successResult = result{
                    let arrData = successResult["posts"].arrayValue
                    for list in arrData{
                        let dict = ["title"             : list["title"].stringValue,
                                    "content"           : list["content"].stringValue,
                                    "date"              : list["date"].stringValue,
                                    "url"               : list["url"].stringValue,
                                    "thumbnail_images"  : list["thumbnail_images"]["full"]["url"].stringValue]
                        
                        let czArticles = CZArticles(dict: dict)
                        self.articleList.append(czArticles)
                    }
                    
                    self.tableView.reloadData()
                }
            }
            
            self.tableView.mj_header.endRefreshing()
        }
    }
}
    
extension HomeListController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList.count
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
            cell = NSBundle.mainBundle().loadNibNamed("HomeListCell", owner: self, options: nil)!.last as? HomeListCell
        }
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let homeInfos = CalculatorController.initWithSB(sbType.sbTypeHome) as! CalculatorController
        if indexPath.row == 1 {
            self.loadArticles()
            return
        }
//        let homeInfos = CalculatorController()
        homeInfos.articleModel = self.articleList[indexPath.row]
        self.navigationController?.pushViewController(homeInfos, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHieght
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var rotation : CATransform3D
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, 0.9, 1);
        
        rotation.m34 = (1.0 / -600.0);
        
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;

        cell.layer.transform = rotation
        
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.6)
        //旋转时间
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        UIView.commitAnimations()

        let articleCell = cell as! HomeListCell
        articleCell.articles = self.articleList[indexPath.row]
    }
}
