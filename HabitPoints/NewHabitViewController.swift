//
//  NewHabitViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 9/1/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
  
  //TODO resign first responder stuff
  
  var tableViewController: ViewController!

  @IBAction func pointValueStepper(sender: UIStepper) {
    pointValueNumber.text = Int(sender.value).description
  }
  
  @IBOutlet weak var bonusValueLabel: UILabel!
  @IBAction func bonusValueStepper(sender: UIStepper) {
    bonusValueLabel.text = Int(sender.value).description + "x"
  }
  @IBOutlet weak var bonusValueStepperNumber: UIStepper!
  @IBOutlet weak var pointValueNumber: UILabel!
  @IBOutlet weak var habitNameField: UITextField!
 // @IBOutlet weak var pointBonusFrequencyField: UITextField!
  @IBOutlet weak var pointBonusFrequencyIntervalField: UISegmentedControl!
  
  @IBAction func addNewHabit(sender: AnyObject) {
    if let pointValue = pointValueNumber.text?.toInt() as Int!,
    bonusFrequencyNumber = Int(bonusValueStepperNumber.value) as Int!,
    bonusFrequencyInterval = pointBonusFrequencyIntervalField.titleForSegmentAtIndex(pointBonusFrequencyIntervalField.selectedSegmentIndex) as String!
    {
      let newHabit = Habit(habitName: habitNameField.text, habitPointValue: pointValue, habitBonusFrequencyNumber: bonusFrequencyNumber, habitBonusFrequencyInterval: bonusFrequencyInterval)
    tableViewController.habits.append(newHabit)
    //TODO Confirmation of Habit
    //TODO Habit draft still exists if not added to list
    navigationController?.popViewControllerAnimated(true)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      habitNameField.delegate = self
      var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
      view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }
}
