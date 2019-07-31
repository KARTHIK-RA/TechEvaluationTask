//
//  BaseAgent.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ReachabilitySwift
class BaseAgent {
    let reachability = Reachability()!
    var networkStatus: Bool {
        get {
            return  reachability.currentReachabilityStatus != .notReachable
        }
    }
}
