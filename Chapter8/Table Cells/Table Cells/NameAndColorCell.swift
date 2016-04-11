//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by daichao on 16/4/11.
//  Copyright © 2016年 com.daichao.*. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {

    var name:String=""
    var color:String=""
    var nameLabel:UILabel!
    var colorLabel:UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect=CGRectMake(0, 5, 70, 15)
        let nameMarker=UILabel(frame: nameLabelRect)
        nameMarker.textAlignment=NSTextAlignment.Right
        nameMarker.text="Name:"
        nameMarker.font=UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(nameMarker)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
