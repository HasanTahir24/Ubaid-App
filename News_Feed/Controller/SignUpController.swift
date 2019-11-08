//
//  SignUpController.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-08.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import  ZKProgressHUD

class SignUpController: UIViewController {

    @IBOutlet weak var userNameField: RoundTextField!
    
    @IBOutlet weak var firstName: RoundTextField!
    
    @IBOutlet weak var lastName: RoundTextField!
    
    @IBOutlet weak var email: RoundTextField!
    
    @IBOutlet weak var passwordField: RoundTextField!
    
    @IBOutlet weak var confirmPassword: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
               Reach().monitorReachabilityChanges()

    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
           if let userInfo = notification.userInfo {
               let status = userInfo["Status"] as! String
               print(status)
               
           }
           
       }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    

    @IBAction func Register(_ sender: Any) {
        if self.userNameField.text?.isEmpty == true {
          self.showAlert(title: "Required Field", message: "Required UserName")
        }
        else if self.email.text?.isEmpty == true{
            self.showAlert(title: "Required Field", message: "Required Email")
        }
        else if self.passwordField.text?.isEmpty == true{
            self.showAlert(title: "Required Field", message: "Required Password")
        }
        else if self.confirmPassword.text?.isEmpty == true{
            self.showAlert(title: "Required Field", message: "Required Confirm Password")
        }
        
        else {
            ZKProgressHUD.show("Loading")
            self.signUPAuthentication(userName: self.userNameField.text!, firstName: "", lastName: "", email: self.email.text!, password: self.passwordField.text!, confirmPassword: self.confirmPassword.text!)
        }
        
    }
    
    
    
    private func signUPAuthentication(userName : String, firstName : String, lastName : String, email : String, password : String,confirmPassword : String) {
    
    let status = Reach().connectionStatus()
          switch status {
          case .unknown, .offline:
                ZKProgressHUD.dismiss()
          showAlert(title: "", message: "Internet Connection Failed")
                       
          case .online(.wwan), .online(.wiFi):
            
            AuthenticationManager.sharedInstance.signUPAuthentication(userName: userName, password: password, email: email, confirmPassword: confirmPassword) { (success, authError, error) in
                if success != nil {
                    ZKProgressHUD.dismiss()
                    print("Login Succesfull")
                }
              else if authError != nil {
                 ZKProgressHUD.dismiss()
                self.showAlert(title: "", message: ((authError?.errors.errorText)!))
                print(authError?.errors.errorText)
                    
                }
                
              else if error != nil {
                    ZKProgressHUD.dismiss()
                    print("error")
                }
                
                
                
            }
            
        
        }
    
    
    
    
    }
    

}
