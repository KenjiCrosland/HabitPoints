//
//  NewHabitViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 9/1/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController, UINavigationControllerDelegate {
  
  //TODO resign first responder stuff
  
  var tableViewController: ViewController!

  @IBOutlet weak var pointValueField: UITextField!
  @IBOutlet weak var habitNameField: UITextField!
  @IBOutlet weak var pointBonusFrequencyField: UITextField!
  @IBOutlet weak var pointBonusFrequencyIntervalField: UISegmentedControl!
  
  @IBAction func addNewHabit(sender: AnyObject) {
    if let pointValue = pointValueField.text.toInt() as Int!,
    bonusFrequencyNumber = pointBonusFrequencyField.text.toInt() as Int!,
    bonusFrequencyInterval = pointBonusFrequencyIntervalField.titleForSegmentAtIndex(pointBonusFrequencyIntervalField.selectedSegmentIndex) as String!
    {
      let newHabit = Habit(habitName: habitNameField.text, habitPointValue: pointValue, habitBonusFrequencyNumber:bonusFrequencyNumber, habitBonusFrequencyInterval: bonusFrequencyInterval)
    tableViewController.habits.append(newHabit)
    //TODO Confirmation of Habit
    //TODO Habit draft still exists if not added to list
    navigationController?.popViewControllerAnimated(true)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
