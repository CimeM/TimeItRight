//
//  ViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 16/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

import MediaPlayer

class MenuViewController: UIViewController {

    @IBOutlet var proGameButton: TINavButton!
    
    
    
    override func viewWillAppear(animated: Bool) {
        let gameData = GameData()
        gameData.resetInstanceData()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        playVideo()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proGameButton.alpha = 0.6
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
//    var moviePlayer = MPMoviePlayerController?()
//    
//    
//    func playVideo() {
//        let path = NSBundle.mainBundle().pathForResource("timeItRightVideo", ofType:"m4v")
//        let url = NSURL.fileURLWithPath(path!)
//        moviePlayer = MPMoviePlayerController(contentURL: url)
//        if let player = moviePlayer {
//            player.view.frame = self.view.bounds
//            player.controlStyle = .None
//            player.prepareToPlay()
//            player.scalingMode = .AspectFit
//            self.view.addSubview(player.view)
//        }
//    }
//    
    
    
    


}

