//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by daichao on 16/4/17.
//  Copyright © 2016年 com.daichao.*. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font:UIFont!
    var favorite:Bool = false
    @IBOutlet weak var fontSampleLabel:UILabel!
    @IBOutlet weak var fontSizeSlider:UISlider!
    @IBOutlet weak var fontSizelabel:UILabel!
    @IBOutlet weak var favoriteSwitch:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fontSampleLabel.font=font
        fontSampleLabel.text="AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz 0123456789"
        fontSizeSlider.value=Float(font.pointSize)
        fontSizelabel.text="\(Int(font.pointSize))"
        favoriteSwitch.on=favorite
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func slideFontSize(slider:UISlider){
        let newSize=roundf(slider.value)
        fontSampleLabel.font=font.fontWithSize(CGFloat(newSize))
        fontSizelabel.text="\(Int(newSize))"
        
    }
    
    @IBAction func toggleFavorite(sender:UISwitch){
        let favoritesList=FavoritesList.sharedFavoriteList
        if sender.on {
            favoritesList.addFavorite(font.fontName)
        }else{
            favoritesList.removeFavorite(font.fontName)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
