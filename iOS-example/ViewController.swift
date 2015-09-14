//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pushToDetail = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 建立按鈕
        let position_x = UIScreen.mainScreen().bounds.width / 2 - 100
        
        pushToDetail.setTitle("coderanch.net", forState: UIControlState.Normal)
        pushToDetail.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        pushToDetail.frame = CGRectMake(position_x, 200, 200, 40)
        pushToDetail.backgroundColor = UIColor.redColor()
        pushToDetail.addTarget(self, action: "push:", forControlEvents: .TouchUpInside)
        self.view.addSubview(pushToDetail)
    }
    
    func push(sender: UIButton!){
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
