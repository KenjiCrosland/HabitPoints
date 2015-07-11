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
  
  var habits = [Habit]()
  let drinkWater = Habit(habitName: "Drink a Glass of Water", habitPointValue: 1, habitBonusFrequency: (5, "Daily"))
  let floss = Habit(habitName: "Floss your teeth", habitPointValue: 2, habitBonusFrequency: (7, "Weekly"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    habits.append(drinkWater)
    habits.append(floss)
    
    
    
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
    
    
    cell.habitTitleLabel.text = habitToDisplay.name
    cell.habitBonusGoalLabel.text = habitBonusString
    cell.habitPointValueLabel.text = pointValueString
    
    return cell
  }
}

