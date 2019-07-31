//
//  Config.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Config {
    static let shared = Config()
    var isOffline = true
    var isMock = false
    var baseUrl = "https://api.qa.mrhe.gov.ae/mrhecloud/v1.4/api/"
    var consumerKey = "mobile_dev"
    var consumerSecret = "20891a1b4504ddc33d42501f9c8d2215fbe85008"
}

