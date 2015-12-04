//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.toolbar.translucent = true
        initImageInstance()
        initScrollViewContainer()
        setupGestureRecognizer()
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    // 產生圖片
    func initImageInstance(){
        self.imageView = UIImageView(image: UIImage(named: "city.jpg")!)
    }
    
    // 產生 Scroll View
    func initScrollViewContainer(){
        self.scrollView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.scrollView.backgroundColor = UIColor.blackColor()
        self.scrollView.contentSize = imageView.bounds.size
        self.scrollView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.scrollView.delegate = self
        self.scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
    }
    
    // 設定一開始圖片縮放比例以及縮到最小情況下的比例
    func setZoomScale() {
        // 計算縮到最小情況下的比例
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        
        // 設定一開始畫面出現時圖片的比例
        scrollView.zoomScale = min(widthScale, heightScale)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    // 縮放時讓圖片永遠置中
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    // 加入偵測點擊兩下事件
    func setupGestureRecognizer() {
        let singleTap = UITapGestureRecognizer(target: self, action: "navigationToggle:")
        singleTap.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
        
        singleTap.requireGestureRecognizerToFail(doubleTap)
    }
    
    // 點擊兩下後 縮放圖片
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
    
    // 點擊一下後 導覽列出現與消失
    func navigationToggle(recognizer: UITapGestureRecognizer){
        if self.navigationController?.navigationBar.alpha == 0.0{
            showNavigation()
        } else {
            hideNavigation()
        }
    }
    
    func showNavigation(){
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: { () -> Void in
            self.navigationController?.navigationBar.alpha = 1.0
            self.navigationController?.toolbar.alpha = 1.0
            }, completion: nil)
    }
    
    func hideNavigation(){
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: { () -> Void in
            self.navigationController?.navigationBar.alpha = 0.0
            self.navigationController?.toolbar.alpha = 0.0
            }, completion: nil)
    }
}

