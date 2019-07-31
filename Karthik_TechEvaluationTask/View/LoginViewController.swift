//
//  LoginViewController.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var m_EmailAddressTxtFld: UITextField!
    @IBOutlet weak var m_PasswordTxtFld: UITextField!
    @IBOutlet weak var m_ScrollviewBottomConstr: NSLayoutConstraint!
    @IBOutlet weak var m_LoginBtn: UIButton!
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.view.addGestureRecognizer(tapGR)
        setDefaultApperence()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    private func setDefaultApperence()  {
        self.navigationItem.title = "Login".localized()
       
        
        m_EmailAddressTxtFld.placeholder = "EmailAddressPlaceHolder".localized()
        m_EmailAddressTxtFld.keyboardType = .emailAddress
        
        m_PasswordTxtFld.placeholder = "PasswordPlaceHolder".localized()
        m_PasswordTxtFld.isSecureTextEntry = true
        
        
        m_LoginBtn.setTitle("Login".localized(), for: .normal)
        m_LoginBtn.backgroundColor  = UIColor.black
        m_LoginBtn.setTitleColor(UIColor.white, for: .normal)
        m_LoginBtn.layer.cornerRadius = 5
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
    
    @IBAction func act_Login(_ sender: UIButton) {
        viewModel.login(emailId: m_EmailAddressTxtFld.text, password: m_PasswordTxtFld.text)
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
extension LoginViewController : LoginProtocol {
    func loginSuccess() {
        
        DispatchQueue.main.async {
            let onBoarding = NewsFeedViewController.instantiate(fromAppStoryboard: .Main)
            let navication = UINavigationController(rootViewController: onBoarding)
            UIApplication.shared.keyWindow?.rootViewController = navication
        }
       
    }
}
