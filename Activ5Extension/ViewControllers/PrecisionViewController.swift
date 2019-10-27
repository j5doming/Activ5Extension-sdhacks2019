//
//  PrecisionViewController.swift
//  Activ5Extension
//
//  Created by Cheery Wang on 10/26/19.
//  Copyright © 2019 VBC. All rights reserved.
//

import UIKit
import Foundation
class PrecisionViewController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var weeklyAvgTextField: UITextField!
    @IBOutlet weak var improveAvgTextField: UITextField!
    
    var delegate: GoalDelegate?
    var weeklyGoal: Goal? = nil
    var improveGoal: Goal? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        tabBarController?.delegate = self
        let tbc = tabBarController as! GoalsTabBarViewController
        delegate = tbc.goalDelegate
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSetGoal(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        print("doing")
        let dateSet = Date()
        if let weeklyAvg = weeklyAvgTextField.text, let improveAvg = improveAvgTextField.text{
            if !weeklyAvg.isEmpty {
                weeklyGoal = Goal(type: GoalType.acurracy, dateSet: dateSet, goalDate: nil, goal: Double(weeklyAvg)!)
                delegate.addGoal(weeklyGoal!)
            }
            
            if !improveAvg.isEmpty {
                improveGoal = Goal(type: GoalType.acurracy, dateSet: dateSet, goalDate: nil, goal: Double(improveAvg)!)
                delegate.addGoal(improveGoal!)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }

}
