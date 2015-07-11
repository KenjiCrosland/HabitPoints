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
  var bonusFrequency: (number:Int, interval:String)
  
  init(habitName: String, habitPointValue: Int, habitBonusFrequency: (Int, String)) {
    name = habitName
    pointValue = habitPointValue
    bonusFrequency = habitBonusFrequency
  }
 
}
