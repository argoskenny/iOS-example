//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 建立 webview 畫面大小
        let webV: UIWebView = UIWebView(frame: CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-20))
        
        // 設定要顯示的網頁連結
        if let url = NSURL(string: "http://coderanch.net/67") {
            let request = NSURLRequest(URL: url)
            webV.loadRequest(request)
        }
        self.view.addSubview(webV)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

