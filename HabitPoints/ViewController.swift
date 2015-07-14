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
  @IBAction func actionCompleted(sender:UIButton){
    let habit = habits[sender.tag]
    pointGoalLabel.text = habit.name
    sender.setImage(UIImage(named: "button_selected"), forState: UIControlState.Normal)
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
    
    //String Operations For the Labels in the HabitCell
    let habitBonusString = "\(habitToDisplay.bonusFrequency.0)" + "x " + "\(habitToDisplay.bonusFrequency.1)"
    var pointValueString = ""
    if habitToDisplay.pointValue == 1 {
      pointValueString = "1 Point"
    } else
    {
      pointValueString = "\(habitToDisplay.pointValue) Points"
    }
    
    
    //Created a initial test button to see if I can get a button within UITableViewCell to Work Properly
    cell.button1.tag = indexPath.row
    cell.button1.addTarget(self, action: "actionCompleted:", forControlEvents: .TouchUpInside)
    
    cell.habitTitleLabel.text = habitToDisplay.name
    cell.habitBonusGoalLabel.text = habitBonusString
    cell.habitPointValueLabel.text = pointValueString
    
    return cell
  }
}

