//
//  RootViewController.swift
//  Fonts
//
//  Created by daichao on 16/4/13.
//  Copyright © 2016年 com.daichao.*. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private var familyNames:[String]!
    private var cellPointSize:CGFloat!
    private var favoritesList:FavoritesList!
    private let familyCell="FamilyName"
    private let favoritesCell="Favorites"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyNames=(UIFont.familyNames() as [String]).sort()
        let preferredTableViewFont=UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize=preferredTableViewFont.pointSize
        favoritesList=FavoritesList.sharedFavoriteList
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    func fontForDisplay(atIndexPath indexPath:NSIndexPath) -> UIFont?{
        if indexPath.section==0{
            let familyName=familyNames[indexPath.row]
            let fontName=UIFont.fontNamesForFamilyName(familyName).first!
            return UIFont(name: fontName, size: cellPointSize)
            
            
        }else{
            return nil
        }
        
        
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return favoritesList.favorites.isEmpty ? 1 : 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section==0{
            let cell=tableView.dequeueReusableCellWithIdentifier(familyCell, forIndexPath: indexPath)
            
            cell.textLabel?.font=fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text=familyNames[indexPath.row]
            cell.detailTextLabel?.text=familyNames[indexPath.row]
            return cell
        }
        else{
            return tableView.dequeueReusableCellWithIdentifier(favoritesCell, forIndexPath: indexPath)
        }
    }
}
