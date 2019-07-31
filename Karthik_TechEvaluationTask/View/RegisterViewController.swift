//
//  PostMyConcernViewController.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var m_EidTxtFld: UITextField!
    @IBOutlet weak var m_EmailAddressTxtFld: UITextField!
    @IBOutlet weak var m_IdBarahNoTxtFld: UITextField!
    @IBOutlet weak var m_SaveBtn: UIButton!
    @IBOutlet weak var m_MobileNoTxtFld: UITextField!
    @IBOutlet weak var m_UnifiedNoTxtFld: UITextField!
    @IBOutlet weak var m_NameTxtFld: UITextField!
    @IBOutlet weak var m_ScrollviewBottomConstr: NSLayoutConstraint!
    
    var viewModel = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.view.addGestureRecognizer(tapGR)
        setDefaultApperence()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    private func setDefaultApperence()  {
         self.navigationItem.title = "Register".localized()
         m_EidTxtFld.placeholder = "EidPlaceHolder".localized()
        m_EidTxtFld.keyboardType = .numberPad
        
         m_EmailAddressTxtFld.placeholder = "EmailAddressPlaceHolder".localized()
        m_EmailAddressTxtFld.keyboardType = .emailAddress
        
         m_IdBarahNoTxtFld.placeholder = "IdBarahNoPlaceHolder".localized()
        m_IdBarahNoTxtFld.keyboardType = .numberPad
        
         m_MobileNoTxtFld.placeholder = "m_MobileNoPlaceHolder".localized()
         m_MobileNoTxtFld.keyboardType = .phonePad
        
         m_UnifiedNoTxtFld.placeholder = "UnifiedNoPlaceHolder".localized()
         m_UnifiedNoTxtFld.keyboardType = .numberPad
        
         m_NameTxtFld.placeholder = "NamePlaceHolder".localized()
        
        m_SaveBtn.setTitle("Register".localized(), for: .normal)
        m_SaveBtn.backgroundColor  = UIColor.black
        m_SaveBtn.setTitleColor(UIColor.white, for: .normal)
        m_SaveBtn.layer.cornerRadius = 5
        
    }

    @objc func didTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc func keyboardWillChange(notification: Notification){
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if(notification.name == UIResponder.keyboardWillShowNotification) {
            m_ScrollviewBottomConstr.constant = keyboardFrame.height
        }else {
            self.m_ScrollviewBottomConstr.constant = 0
        }
    }
    @IBAction func act_save(_ sender: UIButton) {
        viewModel.register(eid: m_EidTxtFld.text, name: m_NameTxtFld.text, idbarahno: m_IdBarahNoTxtFld.text, emailaddress: m_EmailAddressTxtFld.text, unifiednumber: m_UnifiedNoTxtFld.text, mobilNo: m_MobileNoTxtFld.text)
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
extension RegisterViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if m_EidTxtFld == textField {
            m_NameTxtFld.becomeFirstResponder()
        }else if m_NameTxtFld == textField {
            m_IdBarahNoTxtFld.becomeFirstResponder()
        }else if m_IdBarahNoTxtFld == textField {
            m_EmailAddressTxtFld.becomeFirstResponder()
        }else if m_EmailAddressTxtFld == textField {
            m_UnifiedNoTxtFld.becomeFirstResponder()
        }else if m_UnifiedNoTxtFld == textField {
            m_MobileNoTxtFld.resignFirstResponder()
        }
        return true
    }
}
extension RegisterViewController: RegisterProtocol {
    func registersuccess() {
        m_EidTxtFld.text = ""
        m_NameTxtFld.text = ""
        m_IdBarahNoTxtFld.text = ""
        m_EmailAddressTxtFld.text = ""
        m_UnifiedNoTxtFld.text = ""
        m_MobileNoTxtFld.text = ""
    }
}
