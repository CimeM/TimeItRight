//
//  ViewController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 16/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gameData = GameData()
        gameData.resetInstanceData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

