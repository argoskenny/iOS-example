//
//  DetailViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/9/14.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 自定返回鍵
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "pointer_normal.png"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "pointer_touch.png"), forState: UIControlState.Highlighted)
        button.frame = CGRectMake(0, 0, 22, 22)
        button.addTarget(self, action: "backToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        let leftItem: UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = button
        self.navigationItem.leftBarButtonItem = leftItem
        
        // 建立 webview 畫面大小
        let webV: UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-20))
        if let url = NSURL(string: "http://coderanch.net") {
            let request = NSURLRequest(URL: url)
            webV.loadRequest(request)
        }
        self.view.addSubview(webV)
    }
    
    func backToRoot(sender:UIButton!){
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
