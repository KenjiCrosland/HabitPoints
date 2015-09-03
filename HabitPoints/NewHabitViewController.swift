//
//  NewHabitViewController.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 9/1/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController {

  @IBOutlet weak var pointValueField: UITextField!
  
  @IBOutlet weak var habitNameField: UITextField!
  
  @IBOutlet weak var pointBonusFrequencyField: UITextField!
  
  @IBOutlet weak var pointBonusFrequencyUnitField: UISegmentedControl!
  
  @IBAction func addNewHabit(sender: AnyObject) {
    //TODO: Create a new habit and append it to the existing array of habits
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
