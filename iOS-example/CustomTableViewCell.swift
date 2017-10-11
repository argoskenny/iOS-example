//
//  CustomTableViewCell.swift
//  iOS-example
//
//  Created by 中一林 on 2016/3/31.
//  Copyright © 2016年 中一林. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var cellImageView: UIImageView!
    var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellImageView = UIImageView(frame: CGRect(x: 10.0, y: 7.0, width: 30, height: 30))
        cellImageView.contentMode = UIViewContentMode.scaleAspectFill
        cellImageView.clipsToBounds = true
        
        cellTitle = UILabel(frame: CGRect(x: 50.0, y: 7.0, width: 100.0, height: 30))
        
        self.contentView.addSubview(cellImageView)
        self.contentView.addSubview(cellTitle)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
