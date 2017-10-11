//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let listData: Array<String> = ["天天都是星期天","你知道嗎","哈哈哈"]
    
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
        extraTitle.font = UIFont.systemFont(ofSize: 19.0)
        extraTitle.textColor = UIColor.white
        
        extraButton = UIButton(frame: CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50))
        extraButton.addTarget(self, action: #selector(extraPush), for: UIControlEvents.touchUpInside)
        
        extraTouch = UILabel(frame: CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50))
        extraTouch.textColor = UIColor.black
        extraTouch.lineBreakMode = NSLineBreakMode.byWordWrapping
        extraTouch.numberOfLines = 0
        
        extraView = UIView(frame: CGRect(x: 0.0, y: 50.0, width: self.view.frame.width, height: extraHeight))
        extraView.backgroundColor = UIColor.lightGray
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
        currentItem += 1
        if currentItem > lastItemIndex {
            currentItem = 0
        }
        
        self.extraTouch.text = listData[currentItem]
        self.extraTouch.frame = CGRect(x: extratitle_x, y: 8, width: extratitle_width, height: 50)
        self.extraTouch.alpha = 1.0
        UIView.animate(withDuration: 1.0, delay: 3.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: {
            self.extraTouch.frame = CGRect(x: self.extratitle_x, y: 20, width: self.extratitle_width, height: 50)
            self.extraTouch.alpha = 0.0
        }) { (complete: Bool) in
            self.extraAnimateSlide()
        }
    }
    
    @objc func extraPush(sender: UILabel){
        print("go")
        let dv = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        dv?.detailTitle = listData[currentItem]
        self.navigationController?.pushViewController(dv!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

