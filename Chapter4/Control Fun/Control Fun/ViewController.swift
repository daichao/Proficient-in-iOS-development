//
//  ViewController.swift
//  Control Fun
//
//  Created by daichao on 15/12/7.
//  Copyright © 2015年 daichao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBOutlet weak var doSomethingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text="50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()
        
        
    }
    
    @IBAction func backgroundTap(sender:UIControl){
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    
    @IBAction func sliderChange(sender: UISlider) {
        let process=lroundf(sender.value);
        sliderLabel.text="\(process)";
        
    }
   
    @IBAction func switchChanged(sender: UISwitch) {
        let setting=sender.on;
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
        
    }
    
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            leftSwitch.hidden=false
            rightSwitch.hidden=false
            doSomethingButton.hidden=true
        }else{
            leftSwitch.hidden=true
            rightSwitch.hidden=true
            doSomethingButton.hidden=false
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let controller=UIAlertController(title: "Are You Sure?",message: nil,preferredStyle: .ActionSheet)
        let yesAction=UIAlertAction(title: "Yes ,I am Sure!",style: .Destructive,handler: {action in
            let msg=self.nameField.text!.isEmpty
            ?"You can breate easy,everything went OK."
            :"You  can breate easy,\(self.nameField.text),"
                + " everything went OK."
            let controller2=UIAlertController(title: "something was done",message: msg,preferredStyle:.Alert)
            let cancelAction=UIAlertAction(title: "Phew!",style: .Cancel,handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2,animated:true,completion:nil)
            
        })
        let noAction=UIAlertAction(title: "No Way!",style: .Cancel,handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc=controller.popoverPresentationController{
            ppc.sourceView=sender;
            ppc.sourceRect=sender.bounds
        }
        presentViewController(controller, animated: true, completion: nil)
    }
}

