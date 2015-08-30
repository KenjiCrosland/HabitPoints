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
  
  

  @IBAction func goalActionCompleted(sender: UIButton) {
    //TODO: add if let statement
    adjustCheckCircles(view)
  }
  
  
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
  
  func adjustCheckCircles(viewForAdjustment:UIView) {
    let circleArray = getSubviewsOfView(viewForAdjustment)
    //TODO: This code is brittle. If we add more views programmatically it won't work. Figure out how to fix it
    //let tempArray = subSubViews[subSubViews.count - 1].subviews.filter({$0 is CheckCircle})
    //TODO:Add getSubviewsOfView function
    for var i = 0; i < selectedHabit.goalArray.count; i++ {
      if selectedHabit.goalArray[i] == false{
        selectedHabit.goalArray[i] = true
        circleArray[i].isChecked = true
        circleArray[i].setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
        break}
    }
  }
  //TODO: Make this function return an array
  func getSubviewsOfView(v:UIView) -> [CheckCircle] {
    
    var circleArray = [CheckCircle]()
    
    for subview in v.subviews as! [UIView] {
      circleArray += getSubviewsOfView(subview)
      
      if let viewToAppend = subview as? CheckCircle {
        circleArray.append(viewToAppend as CheckCircle)
      }
    }
    
    return circleArray
    /*
    var circleArray = [CheckCircle]()
    // Get the subviews of the view
  
    var subviews = v.subviews
    
    if subviews.count == 0 {
      return circleArray
    }
    
    for subview : AnyObject in subviews{
      if let viewToAppend = subview as? CheckCircle {
        circleArray.append(viewToAppend as CheckCircle)
      }
      // List the subviews of subview
      getSubviewsOfView(subview as! UIView)
    }
    return circleArray
*/
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
