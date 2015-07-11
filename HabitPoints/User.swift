//
//  User.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/10/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class User: NSObject {
  var totalPoints: Int
  var pointGoal: Int
  
  init (usersTotalPoints: Int, usersPointGoal: Int){
  totalPoints = usersTotalPoints
  pointGoal = usersPointGoal
  }
   
}
