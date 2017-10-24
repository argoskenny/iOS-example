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
        let button: UIButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 22.0, height: 22.0))
        button.setImage(UIImage(named: "pointer_normal.png"), for: UIControlState.normal)
        button.setImage(UIImage(named: "pointer_touch.png"), for: UIControlState.highlighted)
        button.addTarget(self, action: #selector(backToRoot(sender:)), for: UIControlEvents.touchUpInside)
        let leftItem: UIBarButtonItem = UIBarButtonItem()
        leftItem.customView = button
        self.navigationItem.leftBarButtonItem = leftItem
        
        // 建立 webview 畫面大小
        let webView: UIWebView = UIWebView(frame: view.frame)
        if let url = URL(string: "http://happy-sisyphus.com/") {
            webView.loadRequest(URLRequest(url: url))
        }
        view.addSubview(webView)
    }
    
    @objc func backToRoot(sender:UIButton!){
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
