//
//  CZEditPicController.swift
//  iOSuper
//
//  Created by chaizhi on 16/9/19.
//  Copyright © 2016年 Chai. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos

class CZEditPicController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var navView : UIView?
    var imgView : UIImageView?
    var titleButton: PMPickerTitleButton?
    var collectionPic : UICollectionView?
    
    var arrImg = [UIImage]()
    var arrGroups = [PHAssetCollection]?()
    var arrAssets = [PHAsset]?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "编辑图片"

        self.edgesForExtendedLayout = .None
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setHeadView()
        
        self.loadArrPic()
    }
    
    func loadArrPic() {
        
        PMImageManger.photoAuthorization { (granted: Bool) in
            if granted {
                
                // Asynchronous get photos, avoid taking the main thread
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                    if (self.arrGroups == nil) {
                        self.arrGroups = PMImageManger.photoLibrarys()
                    }
                    
                    let group = self.arrGroups![0]
                    if (self.arrAssets == nil) {
                        self.arrAssets = PMImageManger.photoAssetsForAlbum(group)
                    }
                    
                    PMImageManger.imageFromAsset(self.arrAssets!.first!, isOriginal: true, toSize: nil, resultHandler: { (image: UIImage?) in
                        // Set header photo
                    })
                    
                    for asset: PHAsset in self.arrAssets! {
                        PMImageManger.imageFromAsset(asset, isOriginal: false, toSize: CGSizeMake(150, 150), resultHandler: { (image: UIImage?) in
                            self.arrImg.append(image!)
                        })
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        // Reload data
                        self.collectionPic?.reloadData()
                    })
                })
            }
        }
    }
}

// MARK:Collection相关
extension CZEditPicController{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    //返回多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    //返回自定义的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CZIMGCell", forIndexPath: indexPath) as! CZIMGCell
        cell.imgPic.image = arrImg[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        PMImageManger.imageFromAsset(arrAssets![indexPath.item], isOriginal: true, toSize: nil, resultHandler: { (image: UIImage?) in
            if let _image = image {
                self.imgView?.image = _image
            }
        })
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = kScreenWidth/4
        return CGSizeMake(width, width)
    }
    
    //返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
}

// MARK:初始化
extension CZEditPicController{
    func setHeadView(){
        
        let leftBarItem = UIBarButtonItem.init(title: "Cancel", style: UIBarButtonItemStyle.Done, target: self, action: #selector(CZEditPicController.cancelClick))
        navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem.init(title: "Next", style: UIBarButtonItemStyle.Done, target: self, action: #selector(CZEditPicController.nextClick))
        navigationItem.rightBarButtonItem = rightBarItem
        
        // Title select photos
        let image = UIImage.init(named: "albums-arrow")
        let hImage = image!.imageWithColor(UIColor.lightGrayColor())
        titleButton = PMPickerTitleButton.init(type: .Custom)
        if #available(iOS 8.2, *) {
            titleButton?.titleLabel?.font = UIFont.systemFontOfSize(17,weight: UIFontWeightMedium
            )
        } else {
            titleButton?.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
        }
        titleButton?.setTitle("Camera", forState: UIControlState.Normal)
        titleButton?.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        titleButton?.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        titleButton?.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Selected)
        titleButton?.setImage(image, forState: UIControlState.Normal)
        titleButton?.setImage(hImage, forState: UIControlState.Highlighted)
        titleButton?.setImage(hImage, forState: UIControlState.Selected)
        titleButton?.sizeToFit()
        titleButton?.addTarget(self, action: #selector(CZEditPicController.titleClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleButton
        
        
        //添加编辑图片区域
        imgView = UIImageView(image: UIImage(named: "pic"))
        imgView?.frame = CGRectMake(0, 0, kScreenWidth, ((kScreenHeight - 64)*0.6))
        imgView?.contentMode = UIViewContentMode.ScaleAspectFill
        imgView?.clipsToBounds = true
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
    
    func cancelClick() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func nextClick() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func titleClick() {
//        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
