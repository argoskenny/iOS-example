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
        let webView: UIWebView = UIWebView(frame: CGRect(x: 0.0, y: 20.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 20))
        
        // 設定要顯示的網頁連結
        if let url = URL(string: "http://happy-sisyphus.com/") {
            webView.loadRequest(URLRequest(url: url))
        }
        self.view.addSubview(webView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

