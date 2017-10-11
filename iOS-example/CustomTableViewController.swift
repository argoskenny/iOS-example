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
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.cellTitle.text = data[indexPath.row]
        cell.cellImageView.image = UIImage(named: data[indexPath.row])
        return cell
    }
}
