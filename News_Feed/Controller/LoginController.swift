//
//  LoginController.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-08.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import ZKProgressHUD

class LoginController: UIViewController {

    
    @IBOutlet weak var userNameField: RoundTextField!
    
    @IBOutlet weak var passwordField: RoundTextField!
    
   var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(LoginController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @objc func networkStatusChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let status = userInfo["Status"] as! String
            print(status)
            
        }
        
    }
    
    @IBAction func SignIn(_ sender: Any) {
        
        if self.userNameField.text?.isEmpty == true {
            self.error = "Error, Required Username"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
//        self.showAlert(title: "Required Field", message: "Required UserName")
         }
        else if self.passwordField.text?.isEmpty == true {
             self.error = "Error, Required Password"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)

//        self.showAlert(title: "Required Field", message: "Required Password")
        }
        else {
            ZKProgressHUD.show("Loading")
        self.loginAuthentication(userName: self.userNameField.text!, password: self.passwordField.text!)
        }
        
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ErrorVC"{
        let destinationVc = segue.destination as! SecurityController
        destinationVc.error = error
    }
       }
    
    
private func loginAuthentication (userName:String, password : String) {
  
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
             self.error = "Internet Connection Failed"
             self.performSegue(withIdentifier: "ErrorVC", sender: self)

        case .online(.wwan), .online(.wiFi):
        
        AuthenticationManager.sharedInstance.loginAuthentication(userName: userName, password: password) { (success, authError, error) in
            
            if success != nil {
                ZKProgressHUD.dismiss()
             print("Login Succesfull")
             self.performSegue(withIdentifier: "imageSlider", sender: self)
                
            }
            
            
            else if authError != nil {
                ZKProgressHUD.dismiss()
                self.error = authError?.errors.errorText ?? ""
                self.performSegue(withIdentifier: "ErrorVC", sender: self)

//                self.showAlert(title: "", message: ((authError?.errors.errorText)!))
                
                print(authError?.errors.errorText)
                
            }
            
            else if error != nil{
             ZKProgressHUD.dismiss()
                print("error")
                
                
            }
            
        }
        
        
        }
        
        
    }
    
    
//    @IBAction func CraeteAccount(_ sender: Any) {
//
//    self.performSegue(withIdentifier: "SignUpVC", sender: self)
//
//    }
    
  

}
