//
//  Goal.swift
//  Activ5Extension
//
//  Created by Juan Dominguez on 10/26/19.
//  Copyright © 2019 VBC. All rights reserved.
//

import Foundation

enum GoalType {
    case strength
    case acurracy
    case activeDuration
}

struct Goal {
    var type: GoalType
    var dateSet: Date
    var goalDate: Date?
    var goal: Double
    
    func getGoal() -> Double {
        switch type {
        case .strength:
            return goal
        case .acurracy:
            return goal / 100.0
        case .activeDuration:
            return goal / 60
        }
    }
}
