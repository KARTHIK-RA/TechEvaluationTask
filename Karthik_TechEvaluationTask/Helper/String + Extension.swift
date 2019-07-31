//
//  String + Extension.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 30/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation


extension String {

    func localized() ->String {
        var appLanguage = ""
        if let languageCode = UserDefaults.standard.value(forKey: "APP_LANGUAGE_CODE") as? String {
            appLanguage = languageCode
        }else {
            appLanguage = "en"
        }
        let path = Bundle.main.path(forResource: appLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    func trimmingString() -> String  {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
    }
    
}
