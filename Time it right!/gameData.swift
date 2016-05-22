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
    var levelTimes          = [[1000, 500, 0 ],
                               [1000, 500, 200],
                               [1500, 1200, 1000, 500],
                               [1500, 1200, 1000, 500, 200]]
    var monthlyHighScore    = [0 ,0 ,0]
    var dayliHighScore      = [0 ,0 ,0]
    var weeklyHighscore     = [0 ,0 ,0]
    var latestScores        = [Int]() // saved last 7 scores
    var gameInstanceLevel   = 0
    var gameLevelSumScoreData = 0 // sum of level gains
    var gameInstanceSumScoreData = 0 //sum of all game levels -> game instance
    var gameOverFlag        = false
    
    
    /**
     Updates data in the NSUser space - updates highscores and dates
     Input data retrieved from class locals
     */
    func updateHighscoresInNSUser (dayHS: [Int],
                                   weekHS: [Int],
                                   monthHS: [Int],
                                   latestScore : Int) {
        
        
        // TODO check for dates and scores -> update or dont update
        if latestScore > 0 {
            
            self.latestScores.append(latestScore)
            print("saving latest scores: \(self.latestScores)")
            // ensure max 7 data points are saved. remove the oldest ones first
            while self.latestScores.count > 7 {
                self.latestScores.removeAtIndex(0)
            }
        }
        
        
        print("saving latest scores: \(self.latestScores)")
        
        
        
        //compare and rewrite weekly highscores if neccessary
        if gameInstanceSumScoreData >= self.monthlyHighScore[0] {
            
            if self.monthlyHighScore[1] != getCalendarComponent().month {
                
                //user reached the current highscore or increased it
                // TODO: motivational message: you reached monthly highscore
                self.monthlyHighScore = [self.gameInstanceSumScoreData,
                                         getCalendarComponent().month,
                                         self.gameInstanceLevel]
            }
        }
        
        //compare and rewrite monthly highscores if neccessary
        //TODO: .week option is not yet supported - future upates
        if gameInstanceSumScoreData >= self.weeklyHighscore[0] {
            
            if self.weeklyHighscore[1] != getCalendarComponent().day {
                
                //user reached the current highscore or increased it
                // TODO: motivational message: you reached weekly highscore
                self.weeklyHighscore = [self.gameInstanceSumScoreData,
                                         getCalendarComponent().day,
                                         self.gameInstanceLevel]
            }
        }
        
        //compare and rewrite daily highscores if neccessary
        if gameInstanceSumScoreData >= self.weeklyHighscore[0] {
            
            if self.dayliHighScore[1] != getCalendarComponent().day {
                
                //user reached the current highscore or increased it
                //TODO: motivational message: you reached daily highscore
                self.dayliHighScore = [self.gameInstanceSumScoreData,
                                        getCalendarComponent().day,
                                        self.gameInstanceLevel]
            }
        }
        
        print("saving latest scores: \(self.latestScores)")
        
        
        //saveHighscores ()
        
        NSUserDefaults.standardUserDefaults().setObject(monthHS,
                                                        forKey: "HighscoreOfTheMonth")
        NSUserDefaults.standardUserDefaults().setObject(weekHS,
                                                        forKey: "HighscoreOfTheWeek")
        NSUserDefaults.standardUserDefaults().setObject(dayHS,
                                                        forKey: "HighscoreOfTheDay")
        print("saving latest scores: \(self.latestScores)")
        NSUserDefaults.standardUserDefaults().setObject(self.latestScores,
                                                        forKey: "LatestScores")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    /**
     Loads highscore data from NSUser Space to local varibles
     variables: monthlyHighScore : [Int], dayliHighScore : [Int], weeklyHighscore : [Int]
     */
    func loadHighscores (){
        //monthly highscore
        self.monthlyHighScore = loadIntArrFormNSUserDefaults("HighscoreOfTheMonth")
        
        // weekly highscore
        self.weeklyHighscore = loadIntArrFormNSUserDefaults("HighscoreOfTheWeek")
        
        //dayly highscore
        self.dayliHighScore = loadIntArrFormNSUserDefaults("HighscoreOfTheDay")
        
        //dayly highscore
        self.latestScores = loadIntArrFormNSUserDefaults("LatestScores")
        
    }
    

    /**
     Saving informatin to NSUserDefault Space
     */
    func saveGameLevelInstanceData(gameOverFlag: Bool, gameLevelSumScoreData : Int,
                              gameInstanceLevel : Int){
        
        print("saving" + "\(gameOverFlag)")
        
        
        //load game instance - game sum score - this is not game level sum score
        self.gameInstanceSumScoreData = loadIntFormNSUserDefaults("GameInstanceSumScoreData")
        
        NSUserDefaults.standardUserDefaults().setObject(
            self.gameInstanceSumScoreData+gameLevelSumScoreData,
            forKey: "GameInstanceSumScoreData")
        
        NSUserDefaults.standardUserDefaults().setObject(gameLevelSumScoreData,
                                                        forKey: "GameLevelSumScoreData")
        NSUserDefaults.standardUserDefaults().setObject(gameInstanceLevel,
                                                        forKey: "GameInstanceLevel")
        NSUserDefaults.standardUserDefaults().setObject(gameOverFlag,
                                                        forKey: "GameOverFlag")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func loadGameInstanceData() {
        
        self.gameInstanceSumScoreData = loadIntFormNSUserDefaults("GameInstanceSumScoreData")
        // TODO error handler  - at return nil
        self.gameOverFlag = loadBoolNSUserDefaults("GameOverFlag")!
        self.gameLevelSumScoreData = loadIntFormNSUserDefaults("GameLevelSumScoreData")
        
        loadGameInstanceLevel()

    }
    
       
    /**
     Reset all game instance scores
     This should happen every time user start a new game.
     */
    
    func resetInstanceData () {
        
        let zero = 0
        NSUserDefaults.standardUserDefaults().setObject(zero,
                                                        forKey: "GameInstanceSumScoreData")
        saveGameInstanceLevel(zero)
        NSUserDefaults.standardUserDefaults().setObject(zero,
                                                        forKey: "GameLevelSumScoreData")
        NSUserDefaults.standardUserDefaults().setObject(false,
                                                        forKey: "GameOverFlag")
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    
    /**
     Load game Instance level saved in NSUser defaults
     */
    func loadGameInstanceLevel() {
        self.gameInstanceLevel = loadIntFormNSUserDefaults("GameInstanceLevel")
    }
    
    /**
     Save game Instance level to NSUser defaults
     */
    func saveGameInstanceLevel(newLvel : Int) {
        NSUserDefaults.standardUserDefaults().setObject(newLvel, forKey: "GameInstanceLevel")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    /**
     Load game Instance Sum Score saved in NSUser defaults
     */
    func loadIntFormNSUserDefaults(key : String) -> Int {
        
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            return (NSUserDefaults.standardUserDefaults().objectForKey(key) as? Int)!
        }
        else {
            print("Error handler - value not saved in NSUser Space. Replaced by 0")
            return 0
        }
        
    }
    
    /**
     Load game Instance Sum Score saved in NSUser defaults
     */
    func loadIntArrFormNSUserDefaults(key : String) -> [Int] {
        var result = [0,0,0]
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            result = (NSUserDefaults.standardUserDefaults().objectForKey(key) as? [Int])!
        }
        else {
            print("Error handler - value not saved in NSUser Space. Replaced by [0,0,0]")
            return result
        }
        return result
        
    }
    
    /**
     Load Bool values, saved in NSUser defaults
     */
    func loadBoolNSUserDefaults(key : String) -> Bool? {
        
        if NSUserDefaults.standardUserDefaults().objectForKey(key) != nil {
            return (NSUserDefaults.standardUserDefaults().objectForKey(key) as? Bool)!
        }
        else {
            print("Error handler - value not saved in NSUser Space. Returned nil")
            return false
        }
        
    }
    
    
    /**
     Get current date information
     Use: getCalendarComponent() .month, .day .year
     TODO: implement .week option
     */
    func getCalendarComponent() -> NSDateComponents{
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        return components
        
    }

}