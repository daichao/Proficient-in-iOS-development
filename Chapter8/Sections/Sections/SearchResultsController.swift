//
//  SearchResultsController.swift
//  Sections
//
//  Created by daichao on 16/4/13.
//  Copyright © 2016年 daichao. All rights reserved.
//

import UIKit

private let longNameSize=6
private let shortNamesButtonIndex=1
private let longNamesButtonIndex=2

class SearchResultsController: UITableViewController ,UISearchResultsUpdating{
    
    let sectionsTableIdentifier="SectionsTableIdentifier"
    var names:[String:[String]]=[String:[String]]()
    var keys:[String]=[]
    var filteredNames:[String]=[]
    
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString=searchController.searchBar.text
        let buttonIndex=searchController.searchBar.selectedScopeButtonIndex
        filteredNames.removeAll(keepCapacity: true)
        
        if !(searchString!.isEmpty){
            let filter:String->Bool={ name in
                //根据所选择的范围按钮可以筛选名称的长度
                let nameLength=name.characters.count
                if(buttonIndex == shortNamesButtonIndex && nameLength >= longNameSize)||(buttonIndex == longNamesButtonIndex && nameLength < longNameSize){
                    return false
                }
                
                let range=name.rangeOfString(searchString!, options: NSStringCompareOptions.CaseInsensitiveSearch)
                return range != nil
                
            }
            
            
            for key in keys{
                let namesForKey=names[key]!
                let matches=namesForKey.filter(filter)
                filteredNames += matches
            }
            
        }
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier)
        
        cell!.textLabel!.text=filteredNames[indexPath.row]

        // Configure the cell...

        return cell!
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
