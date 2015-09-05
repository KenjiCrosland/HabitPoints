//
//  Habit.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/4/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class Habit: NSObject {
  var name: String
  var pointValue: Int
  var pointValueString: String
  var bonusFrequencyNumber: Int
  var bonusFrequencyInterval: String
  var bonusFrequencyString: String
  var goalArray = [Bool]()
  
  init(habitName: String, habitPointValue: Int, habitBonusFrequencyNumber: Int, habitBonusFrequencyInterval: String) {
    name = habitName
    pointValue = habitPointValue
    bonusFrequencyNumber = habitBonusFrequencyNumber
    bonusFrequencyInterval = habitBonusFrequencyInterval
    //Create an array of false booleans for the number
    for var i = 0; i < bonusFrequencyNumber; i++ {
      var newBoolean = false
      goalArray.append(newBoolean)
    }
    bonusFrequencyString = "\(self.bonusFrequencyNumber)" + "x " + "\(self.bonusFrequencyInterval)"
    
    if self.pointValue == 1 {
      pointValueString = "1 Point"
    } else
    {
      pointValueString = "\(self.pointValue) Points"
    }
  }
  
  
  required init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObjectForKey("name") as! String
    self.pointValue = aDecoder.decodeObjectForKey("pointValue") as! Int
    self.pointValueString = aDecoder.decodeObjectForKey("pointValueString") as! String
    self.bonusFrequencyNumber = aDecoder.decodeObjectForKey("bonusFrequencyNumber") as! Int
    self.bonusFrequencyInterval = aDecoder.decodeObjectForKey("bonusFrequencyInterval") as! String
    self.bonusFrequencyString = aDecoder.decodeObjectForKey("bonusFrequencyString") as! String
    self.goalArray = aDecoder.decodeObjectForKey("goalArray") as! [Bool]
  }
  
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeObject(self.pointValue, forKey: "pointValue")
    aCoder.encodeObject(self.pointValueString, forKey: "pointValueString")
    aCoder.encodeObject(self.bonusFrequencyNumber, forKey: "bonusFrequencyNumber")
    aCoder.encodeObject(self.bonusFrequencyInterval, forKey: "bonusFrequencyInterval")
    aCoder.encodeObject(self.bonusFrequencyString, forKey: "bonusFrequencyString")
    aCoder.encodeObject(self.goalArray, forKey: "goalArray")
  }
}

