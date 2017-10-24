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
        let positionX: CGFloat = UIScreen.main.bounds.width / 2.0 - 100.0
        
        pushToDetail.setTitle("HAPPY SISYPHUS", for: UIControlState.normal)
        pushToDetail.setTitleColor(UIColor.white, for: UIControlState.normal)
        pushToDetail.frame = CGRect(x: positionX, y: 200.0, width: 200.0, height: 40.0)
        pushToDetail.backgroundColor = UIColor.red
        pushToDetail.addTarget(self, action: #selector(push(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(pushToDetail)
    }
    
    @objc func push(sender: UIButton!){
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
