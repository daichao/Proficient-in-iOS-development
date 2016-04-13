//
//  FontListViewController.swift
//  Fonts
//
//  Created by daichao on 16/4/13.
//  Copyright © 2016年 com.daichao.*. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {
    var fontNames:[String]=[]
    var showsFavorites:Bool=false
    private var cellPointSize:CGFloat!
    private let cellIdentifier="FontName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferredTableViewFont=UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize=preferredTableViewFont.pointSize
        
    }

    func fontForDisplay(atIndexPath indexPath:NSIndexPath)->UIFont{
        let fontName=fontNames[indexPath.row]
        return UIFont(name: fontName, size: cellPointSize)!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if showsFavorites{
            fontNames=FavoritesList.sharedFavoriteList.favorites
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return fontNames.count
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.font=fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text=fontNames[indexPath.row]
        cell.detailTextLabel?.text=fontNames[indexPath.row]
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
