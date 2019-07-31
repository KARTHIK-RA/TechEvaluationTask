//
//  BaseViewController.swift
//  Karthik_TechEvaluationTask
//
//  Created by Apple on 31/07/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import PKHUD
import ReachabilitySwift

class BaseViewController: UIViewController {
    var delegate: BaseVCProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:- Showing Alert
    func showAlertMessage(message: String) {
        let alertController = UIAlertController(title: APP_NAME, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK".localized(), style: .cancel) { (action) in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true) {
        }
    }
    func showAlert(title: String, message: String,btnsText: [String], OnCompletion: @escaping (_ onclikButtonName: String)->Void ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        for i in 0 ..< btnsText.count {
            alertController.addAction(UIAlertAction(title: btnsText[i], style: UIAlertAction.Style.default, handler:
                {(alert: UIAlertAction!) in
                    OnCompletion(alert.title!)}))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    func logout(){
        let btnsText = ["OK".localized(),"Cancel".localized()]
        self.showAlert(title: APP_NAME, message: "LogoutInfo".localized(), btnsText: btnsText) { (buttonName) in
            if buttonName == "OK"{
                AppUserDefaults.SharedInstance.reset()
                let onBoarding = LoginViewController.instantiate(fromAppStoryboard: .Main)
                let navication = UINavigationController(rootViewController: onBoarding)
                UIApplication.shared.keyWindow?.rootViewController = navication
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
extension BaseViewController: BaseVCProtocol {
    @objc func showAlert(msg: String) {
        self.showAlertMessage(message: msg)
    }
    
    
    //MARK:- Show (or) Hide Activity
    @objc func showLoadingIndicator() {
        if !HUD.isVisible {
            HUD.show(.progress)
        }
    }
    
    @objc func hideLoadingIndicator() {
        if HUD.isVisible {
            HUD.hide()
        }
    }
}
