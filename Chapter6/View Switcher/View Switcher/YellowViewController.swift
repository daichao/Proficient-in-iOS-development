//
//  YellowViewController.swift
//  View Switcher
//
//  Created by daichao on 16/4/7.
//  Copyright © 2016年 daichao. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yellowButtonPressed(sender:UIButton){
        let alert=UIAlertController(title:"Yellow View Button Pressed",message: "You pressed the button on the Yellow View",preferredStyle: .Alert)
        let action=UIAlertAction(title: "Yep,I did",style: .Default,handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    

}
