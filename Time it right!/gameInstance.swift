//
//  gameController.swift
//  Time it right!
//
//  Created by Martin Cimerman on 17/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation


class GameInstance {
    
    var gameInstanceLevel : Int
    
    var timerRunning : Bool
    var timer = NSTimer()
    
    
    init() {
        self.gameInstanceLevel = 0
        self.timerRunning = false
        var gameOverFlag = false
    }
    
    // save the curent level
    func setGameInstanceLevel(newLevel: Int) {
        self.gameInstanceLevel = newLevel
        
    }
    
    // function returns time as a string
    func getTimeString(labelName: String) -> String{
        
        /// check current level  -> get time values
        var result = ""
        switch labelName {
        case "t0seconds":
            result = "t0"
        case "t0miliseconds":
            result = "t0"
        case "t1seconds":
            result = "t1"
        case "t1miliseconds":
            result = "t1"
        case "t2seconds":
            result = "t2"
        case "t2miliseconds":
            result = "t2"
        default:
            result = "ER"
        }
            //check the time (self)
            // load the time
            return result
    }
    
    // converts miliseconds into seconds and remaining milliseconds
    // divides
    func timeConverter(miliseconds : Int)-> Array<String> {
        
        var timeMilis: String
        var timeSeconds: String
        
        if miliseconds == 0 {
            return ["",""]
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
        return [timeSeconds, timeMilis]
    }
    
}