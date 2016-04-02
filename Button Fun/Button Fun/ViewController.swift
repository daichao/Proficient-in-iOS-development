//
//  ViewController.swift
//  Button Fun
//
//  Created by daichao on 15/12/2.
//  Copyright © 2015年 daichao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 @IBOutlet weak var statusLabel: UILabel!

    @IBAction func buttonPressed(sender: UIButton) {
        let title=sender.titleForState(.Normal)!
        let plainText="\(title)  button pressed"
        //statusLabel.text=plainText
        //添加属性字符串
        let styledText=NSMutableAttributedString(string: plainText);
        let attributes=[
            NSFontAttributeName:
            UIFont.boldSystemFontOfSize(statusLabel.font.pointSize)
        ]
        let nameRange=(plainText as NSString).rangeOfString(title)
        styledText.setAttributes(attributes, range: nameRange)
        statusLabel.attributedText=styledText;
        
        
        
    }
    
   
    
}

