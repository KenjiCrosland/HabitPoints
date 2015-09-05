//
//  ViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/4/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func makeRowOfCheckCircles(currentView:UIView, selectedHabit: Habit, yCoordinate: CGFloat, indexPathRow: Int?){
    //TODO Move this function into a separate file
    var xCoordinate: CGFloat = 4
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let screenWidth = screenSize.width
    var containerWidth: CGFloat = (4 + 44 * CGFloat(selectedHabit.goalArray.count))
    let startingWidth = (screenWidth - containerWidth)/2
    var containerView = UIView(frame: (CGRectMake(startingWidth, yCoordinate, containerWidth, 50)))
    currentView.addSubview(containerView)
    
    for var i = 0; i < selectedHabit.bonusFrequencyNumber; i++ {
      var pointButton = CheckCircle()
      pointButton.frame = CGRectMake(xCoordinate, 0, 41, 41)
      if indexPathRow != nil{
        pointButton.tag = indexPathRow!
      }
      pointButton.circleNumber = i
      if selectedHabit.goalArray[i] == false {
        pointButton.isChecked = false
        pointButton.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
      }
      else if selectedHabit.goalArray[i] == true
      {
        pointButton.isChecked = true
        pointButton.setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
      }
      pointButton.addTarget(self, action: "actionCompleted:", forControlEvents: .TouchUpInside)
      containerView.addSubview(pointButton)
      xCoordinate += 44  }
  }
}

class ViewController: UIViewController,  UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var pointGoalLabel: UILabel!
  
  //This is fired off by the button in UITabelViewCell
  @IBAction func actionCompleted(sender:CheckCircle){
    let habit = habits[sender.tag]
    if habit.goalArray[sender.circleNumber] == false {
      sender.isChecked = true
      sender.setImage(UIImage(named: "green-check-circle"), forState: UIControlState.Normal)
      habit.goalArray[sender.circleNumber] = true
      adjustPointValue(user, habit: habit, subtracting: true)
    } else if habit.goalArray[sender.circleNumber] == true {
      sender.isChecked = false
      sender.setImage(UIImage(named: "gray-circle-outline"), forState: UIControlState.Normal)
      habit.goalArray[sender.circleNumber] = false
      adjustPointValue(user, habit: habit, subtracting:false)
    }
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
  }
  
  var habits = [Habit]()
  
  let user = User(usersTotalPoints: 0, usersPointGoal: 10)
  
  let drinkWater = Habit(habitName: "Drink a Glass of Water", habitPointValue: 1, habitBonusFrequencyNumber: 5, habitBonusFrequencyInterval: "Daily")
  let floss = Habit(habitName: "Floss your teeth", habitPointValue: 2, habitBonusFrequencyNumber:7, habitBonusFrequencyInterval: "Weekly")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    
    //Load from NSKeyedArchiver
    if let archivedHabitsArray = loadFromArchive()
    {
      habits = archivedHabitsArray
    }
    else {
      //If the archive returns nil, load from the plist and Save to the Archive
      saveToArchive()
    }
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    pointGoalLabel.text = "Today's Point Goal: " + "\(user.pointGoal)"
    saveToArchive()
    tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
    return habits.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HabitCell
    
    let habitToDisplay = habits[indexPath.row]
    
    // makeRowOfCheckCircles(cell, selectedHabit: habitToDisplay, yCoordinate: 50, indexPathRow: indexPath.row)
    var xCoordinate: CGFloat = 14
    var smallGrayCircleOutline = UIImage(named:"gray-circle-outline-small")
    var smallGreenCircleOutline = UIImage(named:"green-check-circle-small")
    
    for var i = 0; i < habitToDisplay.bonusFrequencyNumber; i++ {
      var smallCheckCircleView = SmallCheckCircle(image: nil)
      smallCheckCircleView.frame = CGRectMake(xCoordinate, 35, 7, 7)
      smallCheckCircleView.tag = indexPath.row
      smallCheckCircleView.circleNumber = i
      if habitToDisplay.goalArray[i] == false {
        smallCheckCircleView.isChecked = false
        smallCheckCircleView.image = smallGrayCircleOutline
      }
      else if habitToDisplay.goalArray[i] == true
      {
        smallCheckCircleView.isChecked = true
        smallCheckCircleView.image = smallGreenCircleOutline
      }
      cell.addSubview(smallCheckCircleView)
      xCoordinate += 8  }
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
        detailViewController.user = user
      }
    }
    else if segue.identifier == "ShowNewHabitViewController" {
      if let newHabitViewController = segue.destinationViewController as? NewHabitViewController {
        newHabitViewController.tableViewController = self
        
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
  
  //loadFromArchive and saveToArchive functions for persistence
  func loadFromArchive() -> [Habit]? {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as? String,
      archivedPeopleArray = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/habitsarchive") as? [Habit]{
        println("loadingfromarchive")
        
        return archivedPeopleArray
        
    }
    return nil
  }
  
  func saveToArchive() {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as? String {
      println("savingtoarchive")
      NSKeyedArchiver.archiveRootObject(habits, toFile:documentsPath + "/habitsarchive")
      
    }
  }
  
}

