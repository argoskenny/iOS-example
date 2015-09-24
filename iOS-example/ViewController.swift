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
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        // 建立按鈕
        let position_x = UIScreen.mainScreen().bounds.width / 2 - 50
        let position_y = UIScreen.mainScreen().bounds.height / 2
        downModal.setTitle("下方選單", forState: UIControlState.Normal)
        downModal.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        downModal.frame = CGRectMake(position_x, position_y + 25, 100, 40)
        downModal.backgroundColor = UIColor.redColor()
        downModal.addTarget(self, action: "down:", forControlEvents: .TouchUpInside)
        
        upModal.setTitle("上方選單", forState: UIControlState.Normal)
        upModal.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        upModal.frame = CGRectMake(position_x, position_y - 25, 100, 40)
        upModal.backgroundColor = UIColor.blueColor()
        upModal.addTarget(self, action: "up:", forControlEvents: .TouchUpInside)
        
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
        callbackView.backgroundColor = UIColor.grayColor()
        callbackView.addSubview(callbackText)
    }
    
    func down(sender: UIButton!){
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: { () -> Void in
            self.downMenu.frame = CGRectMake(0.0, self.view.frame.height - self.menuHeight, self.view.frame.width, self.menuHeight)
            }, completion: nil)
    }
    
    func up(sender: UIButton!){
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: { () -> Void in
            self.upMenu.frame = CGRectMake(0.0, 0.0, self.view.frame.width, self.menuHeight)
            }, completion: { (finished: Bool) -> Void in
            self.view.addSubview(self.callbackView)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
