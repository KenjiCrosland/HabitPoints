//
//  CheckCircle.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/16/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class CheckCircle: UIButton {
  
  var isChecked : Bool

  required init(coder aDecoder: NSCoder) {
    isChecked = false
    super.init(coder: aDecoder)
  }

}
