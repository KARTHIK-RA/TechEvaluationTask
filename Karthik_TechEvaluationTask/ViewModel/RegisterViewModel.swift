//
//  RegisterViewModel.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol RegisterProtocol: BaseVCProtocol {
    func registersuccess()
}
class RegisterViewModel {
    var delegate: RegisterProtocol!
    var model = RegisterModel ()
    func register(eid: String?, name: String?, idbarahno: String?, emailaddress: String?, unifiednumber: String?, mobilNo: String?)  {
        

        guard let  _eid = eid , !_eid.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "EidPlaceHolder".localized())
            return
        }
        
        guard let  _name = name , !_name.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "NamePlaceHolder".localized())
            return
        }
        
        guard let  _idbarahno = idbarahno , !_idbarahno.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "IdBarahNoPlaceHolder".localized())
            return
        }
        
        guard let  _emailaddress = emailaddress , !_emailaddress.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "EmailAddressPlaceHolder".localized())
            return
        }
        if !_emailaddress.validateEmail()  {
            self.delegate.showAlert!(msg: "EmailIdIsInvalid".localized())
            return
        }
        
        guard let  _unifiednumber = unifiednumber , !_unifiednumber.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "UnifiedNoPlaceHolder".localized())
            return
        }
        
        guard let  _mobilNo = mobilNo , !_mobilNo.isEmpty   else  {
            self.delegate.showAlert!(msg: "FieldEmptyMessage".localized() + "m_MobileNoPlaceHolder".localized())
            return
        }
        
        delegate.showLoadingIndicator?()
        model.register(eid: _eid, name: _name, idbarahno: _idbarahno, emailaddress: _emailaddress, unifiednumber: _unifiednumber, mobilNo: _mobilNo, completionHandler: { (status, message) in
            DispatchQueue.main.async {
                self.delegate.hideLoadingIndicator?()
                self.delegate.showAlert!(msg: message ?? "")
                if status {
                    self.delegate.registersuccess()
                }
            }
        })
    }
}
