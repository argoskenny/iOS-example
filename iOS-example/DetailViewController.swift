//
//  DetailViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2015/9/27.
//  Copyright © 2015年 中一林. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detailLabel: UILabel = UILabel(frame: CGRect(x: 0.0, y: 80, width: self.view.frame.width, height: 50.0))
        detailLabel.backgroundColor = UIColor.blackColor()
        detailLabel.text = detailTitle
        detailLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(detailLabel)
    }
    
    func back(sender: UIButton){
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
