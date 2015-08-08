//
//  HabitDetailViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 8/8/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class HabitDetailViewController: UIViewController {
  
  @IBOutlet weak var habitTitleLabel: UILabel!
  @IBOutlet weak var habitPointValueLabel: UILabel!
  @IBOutlet weak var habitBonusGoalLabel: UILabel!
  
  var selectedHabit: Habit!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      habitTitleLabel.text = selectedHabit.name
      habitPointValueLabel.text = selectedHabit.pointValueString
      habitBonusGoalLabel.text = selectedHabit.bonusFrequencyString

        // Do any additional setup after loading the view.
    }


}
