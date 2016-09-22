//
//  CZEditPicController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/19.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit

class CZEditPicController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var navView : UIView?
    var imgView : UIImageView?
    var collectionPic : UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "编辑图片"

        self.edgesForExtendedLayout = .None
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setHeadView()
    }
}

// MARK:Collection相关
extension CZEditPicController{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    //返回多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    //返回自定义的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CZIMGCell", forIndexPath: indexPath) as! CZIMGCell
        return cell
    }

    //返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
}

// MARK:初始化
extension CZEditPicController{
    func setHeadView(){
        
        //添加自定义NAVVIEW
        navView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 64))
        navView?.backgroundColor = UIColor.clearColor()
        navView?.clipsToBounds = true
        self.view.addSubview(navView!)
        
        let btnCancel = self.initBtn(CGRectMake(14, 0 , 60, 64), title: "Cancel", action: #selector(CZEditPicController.cancelClick))
        navView?.addSubview(btnCancel)
        let btnNext = self.initBtn(CGRectMake(kScreenWidth - 80, 0 , 60, 66), title: "Next", action: #selector(CZEditPicController.nextClick))
        navView?.addSubview(btnNext)
        self.view.addSubview(navView!)
        
        //添加编辑图片区域
        imgView = UIImageView(image: UIImage(named: "pic"))
        imgView?.frame = CGRectMake(0, 64, kScreenWidth, ((kScreenHeight - 64)*0.6))
        self.view.addSubview(imgView!)
        
        //添加编辑图片相册collectionView
        let layout = UICollectionViewFlowLayout()
        collectionPic = UICollectionView(frame: CGRectMake(0, CGRectGetMaxY(imgView!.frame), kScreenWidth, kScreenHeight - CGRectGetMaxY(imgView!.frame)), collectionViewLayout: layout)
        collectionPic?.backgroundColor = UIColor.yellowColor()
        collectionPic?.delegate = self
        collectionPic?.dataSource = self
        collectionPic?.registerNib(UINib(nibName: "CZIMGCell", bundle: nil), forCellWithReuseIdentifier: "CZIMGCell")
        self.view.addSubview(collectionPic!)
    }
    
    func initBtn(frame:CGRect, title:String, action:Selector) -> UIButton {
        
        let btnCustom = UIButton(type: .Custom)
        btnCustom.frame = frame
        btnCustom.setTitle(title, forState: .Normal)
        btnCustom.setTitleColor(RGB(203, g: 45, b: 54), forState: .Normal)
        btnCustom.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        
        return btnCustom
    }
    
    func cancelClick() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func nextClick() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
