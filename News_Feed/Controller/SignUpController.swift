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
    
   var error = ""
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
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func Register(_ sender: Any) {
        if self.userNameField.text?.isEmpty == true {
            self.error = "Error, Required Username"
          self.performSegue(withIdentifier: "ErrorVC", sender: self)
        }
        else if self.email.text?.isEmpty == true{
            self.error = "Error, Required Email"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        else if self.passwordField.text?.isEmpty == true{
            self.error = "Error, Required Password"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        else if self.confirmPassword.text?.isEmpty == true{
            self.error = "Error, Required ConfirmPassword"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        
        else {
            ZKProgressHUD.show("Loading")
            self.signUPAuthentication(userName: self.userNameField.text!, firstName: "", lastName: "", email: self.email.text!, password: self.passwordField.text!, confirmPassword: self.confirmPassword.text!)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! SecurityController
        destinationVc.error = self.error
        
    }
    
    
    
    private func signUPAuthentication(userName : String, firstName : String, lastName : String, email : String, password : String,confirmPassword : String) {
    
    let status = Reach().connectionStatus()
          switch status {
          case .unknown, .offline:
                ZKProgressHUD.dismiss()
                self.error = "Internet Connection Failed"
                self.performSegue(withIdentifier: "ErrorVC", sender: self)
          case .online(.wwan), .online(.wiFi):
            
            AuthenticationManager.sharedInstance.signUPAuthentication(userName: userName, password: password, email: email, confirmPassword: confirmPassword) { (success, authError, error) in
                if success != nil {
                    ZKProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "imageSlider", sender: self)
                    print("Login Succesfull")
                }
              else if authError != nil {
                 ZKProgressHUD.dismiss()
                    self.error = authError?.errors.errorText ?? ""
                    self.performSegue(withIdentifier: "ErrorVC", sender: self)
                print(authError?.errors.errorText)
                    
                }
                
              else if error != nil {
                    ZKProgressHUD.dismiss()
                    print("error")
                }
                
                
                
            }
            
        
        }

    }
    
    
    @IBAction func PopView(_ sender: Any) {
        
    self.navigationController?.popViewController(animated: true)
        
    }
    

}
