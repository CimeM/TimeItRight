//
//  SettingsViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 23/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit
import Eureka

class SettingsViewController: FormViewController {

    
    
    
    var alert : UIAlertController?
    
    var gameInstance = GameInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertSetup()
    
        
        
        let continents = ["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America", "South America"]
        
        form +++ Section("Profile settings")
            <<< TextRow(){ row in
                row.title = "Username"
                row.placeholder = "Enter text here"
            }
            <<< DateRow(){
                $0.title = "Date of birth"
                $0.value = NSDate(timeIntervalSinceReferenceDate: 0)
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "ActionSheetRow"
                $0.selectorTitle = "Select your continent"
                $0.options = continents
                $0.value = "Europe"    // initially selected
            }
        
            +++ Section("Game settings")
            <<< ButtonRow(){
                $0.title = "Reset Game Scores"
                $0.onCellSelection({ _,_ in self.presentViewController(self.alert?, animated: true, completion: nil)})
            }
            +++ Section("Back to main menu")
            <<< ButtonRow(){
                $0.title = "Main Menu"
                $0.onCellSelection({ _,_ in self.navigationController?.popViewControllerAnimated(true)})
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: UIButton) {

        self.navigationController?.popViewControllerAnimated(true)
        
    }

    
    func alertSetup() {
        self.alert = UIAlertController(title: "Are you sure?", message: "You will delete history scores", preferredStyle: UIAlertControllerStyle.Alert)
        self.alert!.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.alert!.addAction(UIAlertAction(title: "Delete data",
            style: .Destructive ,
            handler: { (alert: UIAlertAction!) in self.gameInstance.resetHighscores()})
        )
    }


//    /**
//     Function resets highscores and latestScores data in NSUser space
//     */
//    @IBAction func resetButton(sender: UIButton) {
//        
//        gameInstance.resetHighscores()
//        
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
