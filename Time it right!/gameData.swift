//
//  gameData.swift
//  Time it right!
//
//  Created by Martin Cimerman on 17/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation

class GameData {
    
    // time sorted in array in levels - internal array must have 3 values at least 
    var levelTimes = [[1000, 500, 0 ],
                     [1000, 500, 200],
                     [1500, 1200, 1000, 500],
                     [1500, 1200, 1000, 500, 200]]
    
    var monthlyHighScore     = [0 ,0 ,0]
    var dayliHighScore       = [0 ,0 ,0]
    var weeklyHighscore      = [0 ,0 ,0]
    var latestScores = [Int]() // saved last 7 scores
    var gameInstanceLevel = 0
    var gameSumData = 0
    var gameOverFlag = false
    
    func saveHighscoresData (monthlyHighScore: [Int], dayliHighScore : [Int], weeklyHighscore : [Int], latestScores: [Int]) {
        NSUserDefaults.standardUserDefaults().setObject(monthlyHighScore, forKey: "HighscoreOfTheMonth")
        NSUserDefaults.standardUserDefaults().setObject(weeklyHighscore, forKey: "HighscoreOfTheWeek")
        NSUserDefaults.standardUserDefaults().setObject(dayliHighScore, forKey: "HighscoreOfTheDay")
        NSUserDefaults.standardUserDefaults().setObject(latestScores, forKey: "LatestScores")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func saveGameInstanceData(gameOverFlag: Bool, gameSumScoreData : Int,  gameInstanceLevel : Int){
        
        NSUserDefaults.standardUserDefaults().setObject(gameSumScoreData, forKey: "GameSumScoreData")
        NSUserDefaults.standardUserDefaults().setObject(gameInstanceLevel, forKey: "GameInstanceLevel")
        NSUserDefaults.standardUserDefaults().setObject(gameOverFlag, forKey: "GameOverFlag")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func loadGameInstanceData() {
        
        if NSUserDefaults.standardUserDefaults().objectForKey("GameOverFlag") != nil {
            self.gameOverFlag = (NSUserDefaults.standardUserDefaults().objectForKey("GameOverFlag") as? Bool)!
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("GameSumScoreData") != nil {
            self.gameSumData = (NSUserDefaults.standardUserDefaults().objectForKey("GameSumScoreData") as? Int)!
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("GameInstanceLevel") != nil {
            self.gameInstanceLevel = (NSUserDefaults.standardUserDefaults().objectForKey("GameInstanceLevel") as? Int)!
        }
        
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
//        if NSUserDefaults.standardUserDefaults().objectForKey("LatestScores") != nil {
//            self.latestScores = (NSUserDefaults.standardUserDefaults().objectForKey("LatestScores") as? [Int])!
//        }
    }
    
    
    // to delete
    func loadGameInstanceLevel() -> Int {
        if NSUserDefaults.standardUserDefaults().objectForKey("GameInstanceLevel") != nil {
            self.gameInstanceLevel = (NSUserDefaults.standardUserDefaults().objectForKey("GameInstanceLevel") as? Int)!
        }
        return self.gameInstanceLevel
    }
    func saveGameInstanceLevel(newLvel : Int) {
        NSUserDefaults.standardUserDefaults().setObject(newLvel, forKey: "GameInstanceLevel")
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    func resetInstanceData () {
        let zero = 0
        
        NSUserDefaults.standardUserDefaults().setObject(zero, forKey: "GameInstanceLevel")
        
        NSUserDefaults.standardUserDefaults().setObject(zero, forKey: "GameSumScoreData")
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "GameOverFlag")
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}