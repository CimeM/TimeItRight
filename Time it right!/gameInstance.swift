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
    //var milislabel :UILabel

    
    var gameData = GameData()
    
    //var levelTimes : [[Int]]
    //var timeArray : [Int]
    
    init() {

        //self.milislabel = milislabel
        gameData.loadHighscores()
        gameData.loadGameInstanceLevel()
        self.gameInstanceLevel = 0
        self.gameInstanceSumScore = 0
        self.levelData = [0, 0, 0]
        
        // load level data
        self.increaseGameInstanceLevel()
        levelData = gameData.levelTimes[(self.gameInstanceLevel-1) ]
    }
    
    // stop timer, save the score to NSUser and make a transition to scoreViewController
    func gameOver (){
        
        timerRunning = false
        timer.invalidate()
        gameData.saveGameInstanceData(gameOverFlag, gameSumScoreData: gameInstanceSumScore, gameInstanceLevel : gameInstanceLevel)

    }
    
    @objc func counting () {
        
        if levelData[0] < 1 {
            gameOver()
            return
        }
   
        if levelData[0] < levelData[1]
        {
            self.gameOverFlag = true
            gameOver()
            return
        }
        levelData[0] -= 1
    }

    
    /*
     ** retyurns bool status  false -> move to Score VC
     */
    func timeButtonPressed() -> Bool {
        
        // the timer stands still untill we begin and press the button for the 1st time
        if timerRunning == false {
            
            timerRunning = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: #selector(self.counting), userInfo: nil, repeats: true)
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
                gameInstanceSumScore += 100 - calculation
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
        
        self.gameInstanceLevel = gameData.loadGameInstanceLevel()
        // load levels from NS
        self.gameInstanceLevel = gameData.gameInstanceLevel
        // increase by 1
        self.gameInstanceLevel += 1
        //load level data
        self.levelData = gameData.levelTimes[self.gameInstanceLevel]
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
    
    // converts miliseconds into seconds and remaining milliseconds
    func timeConverter(miliseconds : Int, milis : Bool)-> String {
        
        var timeMilis: String
        var timeSeconds: String
        
        if miliseconds == 0 {
            return ""
        }
        
        // formating timer text
        if miliseconds < 10 {
            timeSeconds = "00"
            timeMilis = "0\(miliseconds)"
        }
            
        else if miliseconds < 100 {
            timeSeconds = "00"
            timeMilis = "\(miliseconds)"
        }
        else if miliseconds < 1000 && timerRunning == false{
            
            timeSeconds = "0\(miliseconds/100)"
            timeMilis = "\(miliseconds%100)0"
            
        }
        else if miliseconds < 10000 && timerRunning == false{
            timeSeconds = "\(miliseconds/100)"
            timeMilis = "\(miliseconds%100)0"
        }
        else if miliseconds < 1000 {
            
            if (miliseconds%100) == 0 {
                timeMilis = "00"
            }else {
                timeMilis = "\(miliseconds%100)"
            }
            
            timeSeconds = "0\(miliseconds/100)"
        }
        else if miliseconds < 10000 {
            timeSeconds = "\(miliseconds/100)"
            if (miliseconds%100) == 0 {
                timeMilis = "00"
            }else {
                timeMilis = "\(miliseconds%100)"
            }
        }
        else {
            timeSeconds = "\(miliseconds/100)"
            timeMilis = "\(miliseconds%100)"
        }
        if milis {
            return timeMilis
        }
        else {
            return timeSeconds
        }
    }
    
}