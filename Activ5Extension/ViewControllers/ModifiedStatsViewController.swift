//
//  ModifiedStatsViewController.swift
//  Activ5Extension
//
//  Created by Juan Dominguez on 10/26/19.
//  Copyright © 2019 VBC. All rights reserved.
//

import UIKit
import ActivSync

class ModifiedStatsViewController: UIViewController, GoalDelegate {
    var goals = [Goal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gatherGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func gatherGoals() {
        goals.forEach { goal in
            print(goal)
        }
    }
    
    func addGoal(_ goal: Goal) {
        goals.append(goal)
    }
    


     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
       //  Pass the selected object to the new view controller.
        let vc = segue.destination as! GoalsTabBarViewController
        vc.goalDelegate = self
    }

}
