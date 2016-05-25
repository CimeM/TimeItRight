//
//  gameController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 17/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation
import UIKit

class GameInstance {
    
    var gameInstanceLevel : Int
    
    var timerRunning = false
    var timer = NSTimer()
    var gameOverFlag = false
    var gameInstanceSumScore: Int
    var levelData : [Int]
    
    var levelSumScore = 0
    //var milislabel :UILabel

    var monthlyHighScore    = [0 ,0 ,0]
    
    var dayliHighScore      = [0 ,0 ,0]
    
    var weeklyHighscore     = [0 ,0 ,0]
    
    var latestScores        = [Int]()
    
    var gameData = GameData()
    
    //var levelTimes : [[Int]]
    //var timeArray : [Int]
    
    init() {

        //self.milislabel = milislabel
        gameData.loadHighscores()
        self.dayliHighScore = gameData.dayliHighScore
        self.weeklyHighscore = gameData.weeklyHighscore
        self.monthlyHighScore = gameData.monthlyHighScore
        self.latestScores = gameData.latestScores
        
        gameData.loadGameInstanceLevel()
        self.gameInstanceLevel = gameData.gameInstanceLevel
        self.gameInstanceSumScore = gameData.gameLevelSumScoreData
        self.levelData = [0, 0, 0]
        
    }
    
    // stop timer, save the score to NSUser
    func gameOver(){
        
        timerRunning = false
        timer.invalidate()
        gameData.saveGameLevelInstanceData(self.gameOverFlag,
                                      gameLevelSumScoreData: gameInstanceSumScore,
                                      gameInstanceLevel : gameInstanceLevel)

    }
    
    @objc func counting() {
        
        if levelData[0] < 1 {
            gameOver()
            return
        }
   
        if levelData[0] < levelData[1]
        {
            self.gameOverFlag = true
            gameOver()
            //return
        }
        levelData[0] -= 1
    }

    
    /*
     ** retyurns bool status  false -> move to Score VC
     */
    func timeButtonPressed() -> Bool {
        
        // the timer stands still untill we begin and press the button for the 1st time
        if timerRunning == false && self.gameOverFlag == false {
            
            timerRunning = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                                                           target:self,
                                                           selector: #selector(self.counting),
                                                           userInfo: nil,
                                                           repeats: true)
            return true
        }
        
        // user missed the time limit
        if levelData[0] < levelData[1] {
            gameOver()
            return false
        }
        
        // if next time exists
        if levelData[1] > 0 {
            
            // calculate the points
            var calculation = levelData[0] - levelData[1]
            if calculation > 0 && calculation < 100 {
                calculation = levelData[0] - levelData[1]
                self.gameInstanceSumScore += 100 - calculation
                // write to the label
            }
            
            // moving timers in the table
            levelData[0] = 0
            levelData.sortInPlace({$0 > $1})
            
            // there is no time to target -> exit the game
            if levelData[1] == 0 {
                gameOver()
                return false
            }
        }
        
        else {
            gameOver()
            return false
        }
        
        //default return
        return true
        
    }
    
    // save the curent level
    func increaseGameInstanceLevel() {
        
        gameData.loadGameInstanceLevel()
        self.gameInstanceLevel = gameData.gameInstanceLevel
        // load levels from NS
        self.gameInstanceLevel = gameData.gameInstanceLevel
        // increase by 1
        self.gameInstanceLevel += 1
        //load level data
        self.levelData = gameData.levelTimes[self.gameInstanceLevel-1]
        //save level to NS
        gameData.saveGameInstanceLevel(self.gameInstanceLevel)
    }
    
    func getCurrentLevel() -> Int {
        return self.gameInstanceLevel
    }
    
    func getCurrentScore() -> Int {
        return self.gameInstanceSumScore
    }
    
    // function returns time as a string
    func getTimeString(labelName: String) -> String{
        
        var time = 0
        
        /// check current level  -> get time values
        var result = ""
        switch labelName {
        case "t0seconds":
            time = self.levelData[0]
            result = "\(self.timeConverter(time,milis: false))"
        case "t0miliseconds":
            time = self.levelData[0]
            result = "\(self.timeConverter(time,milis: true))"
        case "t1seconds":
            time = self.levelData[1]
            result = "\(self.timeConverter(time,milis: false))"
        case "t1miliseconds":
            time = self.levelData[1]
            result = "\(self.timeConverter(time,milis: true))"
        case "t2seconds":
            time = self.levelData[2]
            result = "\(self.timeConverter(time,milis: false))"
        case "t2miliseconds":
            time = self.levelData[2]
            result = "\(self.timeConverter(time,milis: true))"
        default:
            result = "ER"
        }
        
        return result
        
        // TODO if not defined fill empty string
    }
    
    /** converts miliseconds for corresponding lables
        milis: bool - returnes data for millisecond label otherwise for seconds label
     */
    func timeConverter(miliseconds : Int, milis : Bool)-> String {
        
        
        var result : Int
        
        if miliseconds == 0 {
            return ""
        }
        
        if milis { // miliseconds
            
            result = miliseconds%100
            
        }
        else { // seconds
            
            result = miliseconds/100
            
        }
        
        if result < 10 {
            return "0\(result)"
        }
        else {
            return "\(result)"
        }
        
    }
    
    func updateLocalData () {
        
        gameData.loadGameInstanceData()
        self.gameInstanceSumScore = gameData.gameInstanceSumScoreData
        self.gameOverFlag = gameData.gameOverFlag
        self.levelSumScore = gameData.gameLevelSumScoreData
        
        gameData.loadHighscores()
        self.dayliHighScore = gameData.dayliHighScore
        self.weeklyHighscore = gameData.weeklyHighscore
        self.monthlyHighScore = gameData.monthlyHighScore
        self.latestScores = gameData.latestScores
        
        gameData.loadGameInstanceLevel()
        self.gameInstanceLevel = gameData.gameInstanceLevel
        
    }
    
    
    func gameBegin(){
        self.increaseGameInstanceLevel()
        levelData = gameData.levelTimes[(self.gameInstanceLevel-1) ]
    }
    
    func gameCleanup () {
        
        
        gameOver()
        
        updateLocalData()
        
        gameData.updateHighscoresInNSUser( self.dayliHighScore,
                                           weekHS: self.weeklyHighscore,
                                           monthHS: self.monthlyHighScore,
                                           latestScore : self.gameInstanceSumScore )
        //TODO add additional cleanup
    }
    
    func resetHighscores() {
        gameData.resetHighscoresinNSUserSpace()
    }
    
}