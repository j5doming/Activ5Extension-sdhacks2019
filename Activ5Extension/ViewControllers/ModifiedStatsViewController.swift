//
//  ModifiedStatsViewController.swift
//  Activ5Extension
//
//  Created by Juan Dominguez on 10/26/19.
//  Copyright © 2019 VBC. All rights reserved.
//

import UIKit
import ActivSync

class ModifiedStatsViewController: UIViewController {
    var goals = [Goal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gatherGoals()
    }
    
    func gatherGoals() {
        
    }
    
    func getExercises() {
        let body = [String: Any]()
        ActivSync.request(route: .getExerciseHistory, body: body) { (_, data, error)  in
            
            body.forEach { element in
                print(element)
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
