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
        
        self.navigationItem.title = "Homelist"
        
        self.edgesForExtendedLayout = .Top
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.tableView.hideCellLine(true)
    
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            self.loadArticles()
        })
        tableView.mj_header.beginRefreshing()
        
        self.loadArticles()
    }
    
    func loadArticles() {
    
        
        CZNetWorkTool.shareNetWorkTool.get("http://10.0.0.246:8888/api/get_recent_posts/", para: nil) { (success, result, error) in
            
            if success == true{
                if let successResult = result{
                    let arrData = successResult["posts"].arrayValue
                    self.articleList.removeAll()
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
        
        let articles = self.articleList[indexPath.row]
        cell?.articles = articles
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        let homeInofs = CalculatorController.initWithSB(sbType.sbTypeHome) as! CalculatorController
//        homeInofs.articleModel = self.articleList[indexPath.row]
        if indexPath.row == 1 {
            self.loadArticles()
            return
        }
        let homeInfos = CalculatorController()
        homeInfos.articleModel = self.articleList[indexPath.row]
        self.navigationController?.pushViewController(homeInfos, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHieght
    }
}
