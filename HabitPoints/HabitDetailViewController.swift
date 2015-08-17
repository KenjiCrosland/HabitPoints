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
  @IBOutlet weak var pointGoalLabel: UILabel!
  
  @IBAction func actionCompleted(sender:CheckCircle){
    let habit = selectedHabit
    let circle = sender
    if habit.goalArray[sender.circleNumber] == false {
      sender.isChecked = true
      sender.setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
      habit.goalArray[sender.circleNumber] = true
      adjustPointValue(user, habit: habit, subtracting: true)
    } else if habit.goalArray[sender.circleNumber] == true {
      sender.isChecked = false
   
      sender.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
      habit.goalArray[sender.circleNumber] = false
      adjustPointValue(user, habit: habit, subtracting: false)
    }
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
  }
  
  var selectedHabit: Habit!
  var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      habitTitleLabel.text = selectedHabit.name
      habitPointValueLabel.text = selectedHabit.pointValueString
      habitBonusGoalLabel.text = selectedHabit.bonusFrequencyString
      pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
    
 
      makeRowOfCheckCircles(self.view, selectedHabit: selectedHabit, yCoordinate: 190, indexPathRow: nil)
      
  //    CheckCircle.makeRowOfCheckCircles(self, selectedHabit: selectedHabit, yCoordinate: detailYCoordinate)
/*
      var buttonXCoordinateNumber: CGFloat = 4
      
      for var i = 0; i < selectedHabit.bonusFrequency.number; i++ {
        var pointButton = CheckCircle()
        pointButton.frame = CGRectMake(buttonXCoordinateNumber, 190, 41, 41)
        //pointButton.tag = indexPath.row
        pointButton.circleNumber = i
        if selectedHabit.goalArray[i] == false {
        pointButton.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
        }
        else
        {
        pointButton.setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
        }
        pointButton.addTarget(self, action: "actionCompleted:", forControlEvents: .TouchUpInside)
        view.addSubview(pointButton)
        buttonXCoordinateNumber += 44
      }
      */
      
        // Do any additional setup after loading the view.
    }
  func adjustPointValue(user: User, habit:Habit, subtracting: Bool) {
    if subtracting == true {
      user.pointGoal -= habit.pointValue
    } else if subtracting == false {
      user.pointGoal += habit.pointValue
    }
    if user.pointGoal == 0 {
      if let goalCompletedView = self.storyboard!.instantiateViewControllerWithIdentifier("goalCompletedViewController") as? goalCompletedViewController{
        presentViewController(goalCompletedView, animated: true, completion: nil)
      }
      
    }
  }

}
