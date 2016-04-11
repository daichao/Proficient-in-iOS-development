//
//  ViewController.swift
//  Sections
//
//  Created by daichao on 16/4/11.
//  Copyright © 2016年 daichao. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{

    let sectionsTableIdentifier="SectionsTableIdentifier"
    var names:[String:[String]]!
    var keys:[String]!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        let path=NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
        let nameDict=NSDictionary(contentsOfFile: path!)
        names=nameDict as! [String:[String]]!
        keys=(nameDict!.allKeys as! [String]).sort()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key=keys[section]
        let nameSection=names[key]!
        return nameSection.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier, forIndexPath: indexPath)
        let key=keys[indexPath.section]
        let nameSection=names[key]
        cell.textLabel!.text=nameSection![indexPath.row]
        
        return cell
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
    }
}

