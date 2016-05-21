//
//  ScoreViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 18/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    
    @IBOutlet var topScoreLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!

    @IBOutlet var levelLabel: UILabel!
    
    @IBOutlet var currentScoreLabel: UILabel!
    
    @IBOutlet var totalScoreLabel: UILabel!
    
    @IBOutlet var contiueButton: TINavButton!
    
    var nextLevelTimer = 5
    
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load total score 
        var gameData = GameData()
        gameData.loadGameInstanceData()
        topScoreLabel.text = "lvl \(gameData.gameInstanceLevel) \(gameData.gameLevelSumScoreData)"
        
        levelLabel.text = "Level \(gameData.gameInstanceLevel)"
        
        currentScoreLabel.text = "\(gameData.gameLevelSumScoreData)"
        totalScoreLabel.text = "\(gameData.gameInstanceSumScoreData)"
        
        // hide next level button
        if gameData.gameOverFlag {
            contiueButton.enabled = false
        }
        
        //if there is no levels left, disable the button
        if gameData.levelTimes.count == gameData.gameInstanceLevel {
            contiueButton.enabled = false
        }
        else {
            // start the timer for 'continue' button
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(self.buttonTimeout), userInfo: nil, repeats: true)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: AnyObject) {
        
        // TODO end game and save data
        let menuvc = self.storyboard?.instantiateViewControllerWithIdentifier("idMenuViewController") as! MenuViewController
        self.presentViewController(menuvc, animated: true, completion: nil)
    }

    @IBAction func continueButton(sender: AnyObject) {
        
        self.transitionToGame()
        
    }
    
    func transitionToGame() {
        // stop timer
        timer.invalidate()
        
        // TODO end game and save data
        let gamevc = self.storyboard?.instantiateViewControllerWithIdentifier("idGameViewController") as! GameViewController
        
        self.presentViewController(gamevc, animated: true, completion: nil)
    }

    func buttonTimeout() {
        nextLevelTimer-=1
        contiueButton.setTitle("Continue \(nextLevelTimer)s", forState: .Normal)
        
        if nextLevelTimer == 0 {
            transitionToGame()
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
