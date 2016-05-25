//
//  ViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 16/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var proGameButton: TINavButton!
    
    
    
    override func viewWillAppear(animated: Bool) {
        let gameData = GameData()
        gameData.resetInstanceData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proGameButton.alpha = 0.6
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

