//
//  CustomTableViewController.swift
//  iOS-example
//
//  Created by 中一林 on 2016/3/31.
//  Copyright © 2016年 中一林. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    let data: Array<String> = ["apple","ball","cat","doll","egg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(CustomTableViewCell.self as AnyClass, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        cell.cellTitle.text = data[indexPath.row]
        cell.cellImageView.image = UIImage(named: data[indexPath.row])
        return cell
    }
}
