//
//  ViewController.swift
//  Orientations
//
//  Created by daichao on 16/4/3.
//  Copyright © 2016年 daichao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)|
                Int(UIInterfaceOrientationMask.LandscapeLeft.rawValue)
    }


}

