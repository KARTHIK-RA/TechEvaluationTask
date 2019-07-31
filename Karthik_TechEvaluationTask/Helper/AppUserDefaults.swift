//
//  AppUserDefaults.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class AppUserDefaults: NSObject  {
    // MARK:- Instances Variables
    static let  SharedInstance = AppUserDefaults()
    let userdefaults = UserDefaults.standard
    
    
    // Current LoggedIn User Email Id
    var emailId: String {
        get {
            if let emailId = userdefaults.value(forKey: "EmailId") as? String {
                return emailId
            } else {
                return ""
            }
        } set(emailId) {
            userdefaults.set(emailId, forKey: "EmailId")
            userdefaults.synchronize()
        }
    }

    var isAlreadyLogin: Bool {
        get {
            if let isAlreadyLogin = userdefaults.value(forKey: "isAlreadyLogin") as? Bool {
                return isAlreadyLogin
            } else {
                return false
            }
        } set(isAlreadyLogin) {
            userdefaults.set(isAlreadyLogin, forKey: "isAlreadyLogin")
            userdefaults.synchronize()
        }
    }

    func reset() {
        self.emailId = ""
        self.isAlreadyLogin = false
        
    }
}
