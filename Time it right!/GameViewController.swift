//
//  ViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 18/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var t0SecondsLabel: UILabel!
    
    @IBOutlet var t0milisecondsLabel: UILabel!
    
    @IBOutlet var t1secondsLabel: UILabel!
    
    @IBOutlet var t1milisecondsLabel: UILabel!
    
    @IBOutlet var t2secondsLabel: UILabel!
    
    @IBOutlet var t2milisecondsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.currentGame = GameInstance()
        //self.updateLables()
    }

    //is called every millisecond
    func updatet0Lables () {
        // load data into labels (timers)
        //t0secondsLabel.text = currentGame.getTimeString("t0seconds")
        //t0milisecondsLabel.text = currentGame.getTimeString("t0miliseconds")
    }
    
    func updateLables() {
        
        // TODO remove coloms
        
        // load data into labels (timers)
        //        t0secondsLabel.text = "fs"//  currentGame.getTimeString("t0seconds")
        //        t0milisecondsLabel.text = "fs"// currentGame.getTimeString("t0miliseconds")
        
        // load data into labels (timers)
        //        t1secondsLabel.text = "fs"// currentGame.getTimeString("t1seconds")
        //        t1milisecondsLabel.text =  "fs"//currentGame.getTimeString("t1miliseconds")
        
        // load data into labels (timers)
        //t2secondsLabel.text =  "fs"//currentGame.getTimeString("t2seconds")
        //t2milisecondsLabel.text = "fs"//currentGame.getTimeString("t2miliseconds")
        
        //show current score on the score label
        //scoreLabel.text = "lvl \(currentGame.getCurrentLevel()) \(currentGame.getCurrentScore())"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gameButtonAction(sender: UIButton) {
        
        //currentGame.timeButtonPressed()
        
        // load data into labels (timers)
        //t1secondsLabel.text = currentGame.getTimeString("t1seconds")
        //t1milisecondsLabel.text = currentGame.getTimeString("t1miliseconds")
        
        // load data into labels (timers)
        //t2secondsLabel.text = currentGame.getTimeString("t2seconds")
        //t2milisecondsLabel.text = currentGame.getTimeString("t2miliseconds")
        
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
