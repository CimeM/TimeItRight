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
    
    var gameInstance = GameInstance()
    
    let gameData = GameData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameData.loadGameInstanceData()
        topScoreLabel.text = "lvl " + "\(gameData.gameInstanceLevel) "
                                    + "\(gameData.gameLevelSumScoreData)"
        
        levelLabel.text = "Level \(gameData.gameInstanceLevel)"
        
        currentScoreLabel.text = "\(gameData.gameLevelSumScoreData)"
        totalScoreLabel.text = "\(gameData.gameInstanceSumScoreData)"
        
        // disable next level button
        print("reading: \(gameData.gameOverFlag)")
        if gameData.gameOverFlag {
            contiueButton.enabled = false
            contiueButton.alpha = 0.5
            messageLabel.text = "Game Over!"
        }
        else {
            //if there is no levels left, disable the button
            if gameData.levelTimes.count == gameData.gameInstanceLevel {
                contiueButton.enabled = false
            }
            else {
                // start the timer for 'continue' button
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(self.buttonTimeout), userInfo: nil, repeats: true)
            }
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: AnyObject) {
        
        gameInstance.gameCleanup()
        
        //transition to main menu
        vieWcontrollerSegue("idMenuViewController")
    }

    @IBAction func continueButton(sender: AnyObject) {
        
        self.transitionToGame()
        
    }
    
    func transitionToGame() {
        // stop timer
        timer.invalidate()
        
        // show game ViewController
        vieWcontrollerSegue("idGameViewController")
        
    }

    func buttonTimeout() {
        nextLevelTimer-=1
        contiueButton.setTitle("Continue \(nextLevelTimer)s", forState: .Normal)
        
        if nextLevelTimer == 0 {
            transitionToGame()
        }
    }
    
    /**
     Transitions to View controller with corresponding id
     */
    func vieWcontrollerSegue (ViewControllerId: String) {
        
        
        switch ViewControllerId {
        case "idGameViewController":
            let gameVC = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerId) as! GameViewController
            self.presentViewController(gameVC, animated: true, completion: nil)
        case "idMenuViewController":
            let menuVC = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerId) as! MenuViewController
            self.presentViewController(menuVC, animated: true, completion: nil)
        default:
            break
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
