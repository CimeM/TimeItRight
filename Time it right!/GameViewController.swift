//
//  GameViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 17/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

//import Cocoa
import UIKit
import Charts

class GameViewController: UIViewController {
    
    @IBOutlet var t0secondsLabel: UILabel!
    @IBOutlet var t0milisecondsLabel: UILabel!
    @IBOutlet var t1secondsLabel: UILabel!
    @IBOutlet var t1milisecondsLabel: UILabel!
    @IBOutlet var t2secondsLabel: UILabel!
    @IBOutlet var t2milisecondsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentGame = GameInstance()
        // load data into labels (timers)
        t0secondsLabel.text = currentGame.getTimeString("t0seconds")
        t0milisecondsLabel.text = currentGame.getTimeString("t0miliseconds")
        
        // load data into labels (timers)
        t1secondsLabel.text = currentGame.getTimeString("t1seconds")
        t1milisecondsLabel.text = currentGame.getTimeString("t1miliseconds")
        
        // load data into labels (timers)
        t2secondsLabel.text = currentGame.getTimeString("t2seconds")
        t2milisecondsLabel.text = currentGame.getTimeString("t2miliseconds")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func timeButtonAction(sender: UIButton) {
        
    }
}
