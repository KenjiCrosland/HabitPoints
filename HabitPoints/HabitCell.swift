//
//  HabitCell.swift
//  HabitPoints
//
//  Created by Kenji Crosland on 7/6/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {

  @IBOutlet weak var habitTitleLabel: UILabel!
  
  @IBOutlet weak var habitBonusGoalLabel: UILabel!
  
  @IBOutlet weak var habitPointValueLabel: UILabel!
  
  @IBOutlet weak var button1: UIButton!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
