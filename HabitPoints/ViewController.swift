//
//  ViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/4/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var pointGoalLabel: UILabel!
  
  //This is fired off by the button in UITabelViewCell
  @IBAction func actionCompleted(sender:CheckCircle){
    let habit = habits[sender.tag]
    if sender.isChecked == false {
      sender.isChecked = true
      sender.setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
      adjustPointValue(user, habit: habit, subtracting: true)
    } else if sender.isChecked == true {
      sender.isChecked = false
      sender.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
      adjustPointValue(user, habit: habit, subtracting: false)
    }
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
  }
  
  var habits = [Habit]()
  
  let user = User(usersTotalPoints: 0, usersPointGoal: 10)
  
  let drinkWater = Habit(habitName: "Drink a Glass of Water", habitPointValue: 1, habitBonusFrequency: (5, "Daily"))
  let floss = Habit(habitName: "Floss your teeth", habitPointValue: 2, habitBonusFrequency: (7, "Weekly"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    habits.append(drinkWater)
    habits.append(floss)
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
    return habits.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HabitCell
    
    let habitToDisplay = habits[indexPath.row]
    
    var buttonXCoordinateNumber: CGFloat = 4
    
    for var i = 0; i < habitToDisplay.bonusFrequency.number; i++ {
      var pointButton = CheckCircle()
      pointButton.frame = CGRectMake(buttonXCoordinateNumber, 50, 41, 41)
      pointButton.tag = indexPath.row
      pointButton.circleNumber = i
      pointButton.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
      pointButton.addTarget(self, action: "actionCompleted:", forControlEvents: .TouchUpInside)
      cell.addSubview(pointButton)
      buttonXCoordinateNumber += 44
    }
    
    //Created a initial test button to see if I can get a button within UITableViewCell to Work Properly
   /* cell.button1.tag = indexPath.row
    cell.button1.addTarget(self, action: "actionCompleted:", forControlEvents: .TouchUpInside)*/
    
    cell.habitTitleLabel.text = habitToDisplay.name
    cell.habitBonusGoalLabel.text = habitToDisplay.bonusFrequencyString
    cell.habitPointValueLabel.text = habitToDisplay.pointValueString
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowHabitDetailViewController" {
      if let detailViewController = segue.destinationViewController as? HabitDetailViewController,
      selectedIndexPathRow = tableView.indexPathForSelectedRow()?.row
      {
        var selectedHabit = habits[selectedIndexPathRow]
        detailViewController.selectedHabit = selectedHabit
      }
    }
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

