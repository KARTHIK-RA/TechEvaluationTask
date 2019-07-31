//
//  LoginViewModel.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol LoginProtocol: BaseVCProtocol {
    func loginSuccess()
}

class LoginViewModel {
    var delegate: LoginProtocol!
    func login(emailId: String?, password: String?)  {

        guard let  _emailId = emailId , !_emailId.trimmingString().isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "EmailAddressPlaceHolder".localized())
            return
        }
        if !_emailId.validateEmail()  {
            self.delegate.showAlert!(msg: "EmailIdIsInvalid".localized())
            return
        }
        guard let  _password = password , !_password.trimmingString().isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "PasswordPlaceHolder".localized())
            return
        }
        AppUserDefaults.SharedInstance.isAlreadyLogin = true
        AppUserDefaults.SharedInstance.emailId = _emailId
        delegate.loginSuccess()
    }
}
