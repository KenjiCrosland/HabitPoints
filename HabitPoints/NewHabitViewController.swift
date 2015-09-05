//
//  NewHabitViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 9/1/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController {
  
  var tableViewController: ViewController!
  var habits: [Habit]!
  var user: User!

  @IBOutlet weak var pointValueField: UITextField!
  @IBOutlet weak var habitNameField: UITextField!
  @IBOutlet weak var pointBonusFrequencyField: UITextField!
  @IBOutlet weak var pointBonusFrequencyIntervalField: UISegmentedControl!
  
  @IBAction func addNewHabit(sender: AnyObject) {
    if let pointValue = pointValueField.text.toInt() as Int!,
    bonusFrequency = pointBonusFrequencyField.text.toInt() as Int!,
    bonusFrequencyInterval = pointBonusFrequencyIntervalField.titleForSegmentAtIndex(pointBonusFrequencyIntervalField.selectedSegmentIndex) as String!
    {
    let newHabit = Habit(habitName: habitNameField.text, habitPointValue: pointValue, habitBonusFrequency: (bonusFrequency, bonusFrequencyInterval))
    tableViewController.habits.append(newHabit)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
