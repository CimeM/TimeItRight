//
//  gameData.swift
//  Time it right!
//
//  Created by Martin Cimerman on 17/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class GameData {
    
    // time sorted in array in levels
    var levelTimes = [[1000, 500 ],
                     [1000, 500, 200],
                     [1500, 1200, 1000, 500],
                     [1500, 1200, 1000, 500, 200]]
    
    var monthlyHighScore     = [0 ,0 ,0]
    var dayliHighScore       = [0 ,0 ,0]
    var weeklyHighscore      = [0 ,0 ,0]
    var latestScores = [0,0,0,0,0,0,0] // saved last 7 scores
    
    func saveData (monthlyHighScore: [Int], dayliHighScore : [Int], weeklyHighscore : [Int], latestScores: [Int]) {
        NSUserDefaults.standardUserDefaults().setObject(monthlyHighScore, forKey: "HighscoreOfTheMonth")
        NSUserDefaults.standardUserDefaults().setObject(weeklyHighscore, forKey: "HighscoreOfTheWeek")
        NSUserDefaults.standardUserDefaults().setObject(dayliHighScore, forKey: "HighscoreOfTheDay")
        NSUserDefaults.standardUserDefaults().setObject(latestScores, forKey: "LatestScores")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    // loads the data and saves it to NSUserDefaults
    func loadHighscores (){
        //monthly highscore
        if NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheMonth") != nil {
            self.monthlyHighScore = (NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheMonth") as? [Int])!
        }
        // weekly highscore
        if NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheWeek") != nil {
            self.weeklyHighscore = (NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheWeek") as? [Int])!
        }
        //dayly highscore
        if NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheDay") != nil {
            self.dayliHighScore = (NSUserDefaults.standardUserDefaults().objectForKey("HighscoreOfTheDay") as? [Int])!
        }
        //latestScores
        if NSUserDefaults.standardUserDefaults().objectForKey("LatestScores") != nil {
            self.latestScores = (NSUserDefaults.standardUserDefaults().objectForKey("LatestScores") as? [Int])!
        }

    }
    
}