//
//  ViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/8/27.
//  Copyright (c) 2015年 中一林. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let downModal = UIButton()
    let upModal = UIButton()
    
    var downMenu: UIView!
    var upMenu: UIView!
    var callbackView: UIView!
    
    let menuHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        // 建立按鈕
        let position_x = UIScreen.main.bounds.width / 2 - 50
        let position_y = UIScreen.main.bounds.height / 2
        downModal.setTitle("下方選單", for: UIControlState.normal)
        downModal.setTitleColor(UIColor.white, for: UIControlState.normal)
        downModal.frame = CGRect(x: position_x, y: position_y + 25.0, width: 100.0, height: 40.0)
        downModal.backgroundColor = UIColor.red
        downModal.addTarget(self, action: #selector(down), for: UIControlEvents.touchUpInside)
        
        upModal.setTitle("上方選單", for: UIControlState.normal)
        upModal.setTitleColor(UIColor.white, for: UIControlState.normal)
        upModal.frame = CGRect(x: position_x, y: position_y - 25.0, width: 100.0, height: 40.0)
        upModal.backgroundColor = UIColor.red
        upModal.addTarget(self, action: #selector(up), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(downModal)
        self.view.addSubview(upModal)
        
        // 建立選單
        downMenu = UIView(frame: CGRect(x: 0.0, y: self.view.frame.height, width: self.view.frame.width, height: menuHeight))
        downMenu.backgroundColor = UIColor(patternImage: UIImage(named: "symphony.png")!)
        
        upMenu = UIView(frame: CGRect(x: 0.0, y: -menuHeight, width: self.view.frame.width, height: menuHeight))
        upMenu.backgroundColor = UIColor(patternImage: UIImage(named: "small_steps")!)
        
        self.view.addSubview(downMenu)
        self.view.addSubview(upMenu)
        
        // 最後呼叫的畫面
        let callbackText: UILabel = UILabel(frame: CGRect(x: self.view.frame.width / 2 - 50, y: 7.0, width: 100.0, height: 20.0))
        callbackText.text = "Success!!"
        callbackView = UIView(frame: CGRect(x: 0.0, y: 70.0, width: self.view.frame.width, height: 30.0))
        callbackView.backgroundColor = UIColor.gray
        callbackView.addSubview(callbackText)
    }
    
    @objc func down(sender: UIButton!){
        UIView.animate(withDuration: 0.4) {
            self.downMenu.frame = CGRect(x: 0.0, y: self.view.frame.height - self.menuHeight, width: self.view.frame.width, height: self.menuHeight)
        }
    }
    
    @objc func up(sender: UIButton!){
        UIView.animate(withDuration: 0.4, animations: {
            self.upMenu.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.menuHeight)
        }) { (complete: Bool) in
            self.view.addSubview(self.callbackView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
