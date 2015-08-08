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
  var bonusFrequency: (number:Int, interval:String)
  var bonusFrequencyString: String
  var goalArray = [Bool]()
  
  init(habitName: String, habitPointValue: Int, habitBonusFrequency: (Int, String)) {
    name = habitName
    pointValue = habitPointValue
    bonusFrequency = habitBonusFrequency
    //Create an array of false booleans for the number
    for var i = 0; i < bonusFrequency.number; i++ {
      var newBoolean = false
      goalArray.append(newBoolean)
    }
    bonusFrequencyString = "\(self.bonusFrequency.0)" + "x " + "\(self.bonusFrequency.1)"
    
    if self.pointValue == 1 {
      pointValueString = "1 Point"
    } else
    {
      pointValueString = "\(self.pointValue) Points"
    }
  }
}
