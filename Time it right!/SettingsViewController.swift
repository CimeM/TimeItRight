//
//  SettingsViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 23/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    var gameInstance = GameInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: UIButton) {
        
        let menuVC = self.storyboard?.instantiateViewControllerWithIdentifier("idMenuViewController") as! MenuViewController
        self.presentViewController(menuVC, animated: true, completion: nil)
        
    }

    /**
     Function resets highscores and latestScores data in NSUser space 
     */
    @IBAction func resetButton(sender: UIButton) {
        
        gameInstance.resetHighscores()
        
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
