//
//  main.swift
//  Assignment2
//
//  Created by Merey Orynbassar on 28.04.2022.
//

import Foundation

// 1 - "On"
// 0 - "Off"

protocol Calculated{
    func calculateMinutes(_ time: Int) -> String
    func lightOrNot(_ time: Int, _ numLight: Int, _ stringBalue:String) -> String
    func getHigherValue(_ time: Int) -> Int
    func getLight(_ time: Int,_ numLight: Int) -> String
    func calculateHours(_ time: Int) -> String
    func calculateSeconds(_ time: Int) -> String
    func timeConverter() -> String
}

struct berlinClock : Calculated{
    
    func timeConverter() -> String{
        print("Please enter hours:")
        let hours = readLine() ?? "No value"
        print("Please enter minutes:")
        let minutes = readLine() ?? "No value"
        print("Please enter seconds:")
        let seconds = readLine() ?? "No value"
        
       
        
        let hour = calculateHours(Int(hours) ?? 0)
        let minute = calculateMinutes(Int(minutes) ?? 0)
        let second = calculateSeconds(Int(seconds) ?? 0)
        
        
        return second + " " + hour + " " + minute
        
    }
  
    func getLight(_ time: Int, _ numLight: Int ) -> String{
        return lightOrNot(time, numLight, "1")
    }
    
    func getHigherValue(_ time: Int) -> Int {
        let calculate = time % 5
        return (time - calculate) / 5
    }
    
    
    func lightOrNot(_ time: Int, _ numLight: Int, _ stringBalue: String) -> String {
        var timeString = ""
        for _ in 0..<time {
                   timeString += stringBalue
               }
       
               for _ in 0..<(numLight-time){
                   timeString += "0"
               }
               return timeString
        
    }
    
    
    func calculateMinutes(_ time: Int) -> String{
        let minutesInFirst = lightOrNot(getHigherValue(time), 11, "1")
        let minutesBottom = lightOrNot(time % 5, 4, "1")
        
        return minutesInFirst + " " + minutesBottom
    }
    
    func calculateHours(_ time: Int) -> String{
        let hoursInFirst = getLight(getHigherValue(time), 4)
        let hoursBottom = getLight(time % 5, 4)
        
        return hoursInFirst + " " + hoursBottom
    }
    
    func calculateSeconds(_ time: Int) -> String{
    
        let line = time % 2 == 0 ? "1":"0"
        return line
        
    }
    
}

let berlin = berlinClock()
print(berlin.timeConverter())
