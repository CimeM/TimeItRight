//
//  ViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 18/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var t0secondsLabel: UILabel!
    
    @IBOutlet var t0milisecondsLabel: UILabel!
    
    @IBOutlet var t1secondsLabel: UILabel!
    
    @IBOutlet var t1milisecondsLabel: UILabel!
    
    @IBOutlet var t1colomLabel: UILabel!
    
    @IBOutlet var t2secondsLabel: UILabel!
    
    @IBOutlet var t2milisecondsLabel: UILabel!
    
    @IBOutlet var t2colomLabel: UILabel!
    
    var gameInstance = GameInstance()
    
    var labelUpdatetimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        
        labelUpdatetimer.invalidate()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        gameInstance.gameBegin()
        self.updateLables()
        
        labelUpdatetimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(GameViewController.updatet0Lables), userInfo: nil, repeats: true)
        
    }
    
    
    //navigation
    
    @IBAction func menuButton(sender: UIButton) {
        
        gameInstance.gameOver()
        gameInstance.gameCleanup()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    
    
    //is called every millisecond
    func updatet0Lables () {
        // load data into labels (timers)
        t0secondsLabel.text = gameInstance.getTimeString("t0seconds")
        t0milisecondsLabel.text = gameInstance.getTimeString("t0miliseconds")
    }
    
    
    func updateLables() {
        
        // TODO remove coloms
        
        // load data into labels (timers)
        self.updatet0Lables()
        
        // load data into labels (timers)
        t1secondsLabel.text =  gameInstance.getTimeString("t1seconds")
        t1milisecondsLabel.text =  gameInstance.getTimeString("t1miliseconds")
        if t1milisecondsLabel.text == "" {
            t1colomLabel.text = ""
        }
        
        // load data into labels (timers)
        t2secondsLabel.text = gameInstance.getTimeString("t2seconds")
        t2milisecondsLabel.text = gameInstance.getTimeString("t2miliseconds")
        if t2milisecondsLabel.text == "" {
            t2colomLabel.text = ""
        }
        else {
            t2colomLabel.text = ":"
        }
        
        //show current score on the score label
        scoreLabel.text = "lvl \(gameInstance.getCurrentLevel()) \(gameInstance.getCurrentScore())"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gameButtonAction(sender: UIButton) {
        
        let gameContinues = gameInstance.timeButtonPressed()
        
        if gameContinues == false {
            

            performSegueWithIdentifier("showLevelScoreSegue", sender: sender)
//            let scorevc = self.storyboard?.instantiateViewControllerWithIdentifier("idScoreViewController") as! ScoreViewController
//            self.presentViewController(scorevc, animated: true, completion: nil)
        }
        else {
            self.updateLables()
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
