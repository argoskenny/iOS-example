//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let listData: Array<String> = ["周董生了生了生了一個怪獸噁心死了","靠北幹你娘喇機幹幹比","我糙你媽的機掰查小幹你吃使魂但"]
    
    var currentItem: Int = 0
    
    let extraHeight: CGFloat = 66.0
    var extraView: UIView!
    
    var extraButton: UIButton!
    var extraTouch: UILabel!
    var nextButton: UIButton!
    let extratitle_x: CGFloat = 67.0 + 15.0
    var extratitle_width: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        initExtraView()
    }
    
    func initExtraView(){
        extratitle_width = self.view.frame.width - 67.0 - 30.0
        
        let extraTitle: UILabel = UILabel(frame: CGRect(x: 14.0, y: 23.0, width: 50, height: 20))
        extraTitle.text = "快訊"
        extraTitle.font = UIFont.systemFontOfSize(19)
        extraTitle.textColor = UIColor.whiteColor()
        
        extraButton = UIButton(frame: CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50))
        extraButton.addTarget(self, action: "extraPush:", forControlEvents: UIControlEvents.TouchUpInside)
        
        extraTouch = UILabel(frame: CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50))
        extraTouch.textColor = UIColor.blackColor()
        extraTouch.lineBreakMode = NSLineBreakMode.ByWordWrapping
        extraTouch.numberOfLines = 0
        
        extraView = UIView(frame: CGRect(x: 0.0, y: 50.0, width: self.view.frame.width, height: extraHeight))
        extraView.backgroundColor = UIColor.lightGrayColor()
        extraView.addSubview(extraTitle)
        extraView.addSubview(extraTouch)
        extraView.addSubview(extraButton)
        
        self.view.addSubview(extraView)
        
        // 第一次執行
        if self.listData.count > 1 {
            self.extraAnimateSlide()
        }
    }
    
    func extraAnimateSlide(){
        let listTotal = self.listData.count
        let lastItemIndex = listTotal - 1
        currentItem++
        if currentItem > lastItemIndex {
            currentItem = 0
        }
        
        self.extraTouch.text = listData[currentItem]
        self.extraTouch.frame = CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50)
        self.extraTouch.alpha = 1.0
        UIView.animateWithDuration(1.0, delay: 3.0, options: [], animations: { () -> Void in
            self.extraTouch.frame = CGRect(x: self.extratitle_x, y: 20, width: self.extratitle_width, height: 50)
            self.extraTouch.alpha = 0.0
            }, completion: { (finished: Bool) -> Void in
                self.extraAnimateSlide()
        })
    }
    
    func extraPush(sender: UILabel){
        print("go")
        let dv = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController
        dv?.detailTitle = listData[currentItem]
        self.navigationController?.pushViewController(dv!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

