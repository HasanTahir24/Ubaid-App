//
//  LoginController.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-08.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit
import ZKProgressHUD
import FBSDKLoginKit
import GoogleSignIn

class LoginController: UIViewController {
    
    
    @IBOutlet weak var userNameField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    @IBOutlet weak var fbLoginBtn: FBSDKButton!
    @IBOutlet weak var googleBtn: GIDSignInButton!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        self.fbLoginBtn.titleLabel?.textAlignment = .center
        self.fbLoginBtn.setTitle("Continue with Facebook", for: .normal)
        self.fbLoginBtn.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 15.0)
        GIDSignIn.sharedInstance().presentingViewController = self

        
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
    
    
    
    @IBAction func FBLogin(_ sender: Any) {
        self.facebookLogin() 
    }
    
    
    @IBAction func GoogleSignin(_ sender : Any){
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
    
    @IBAction func ForgetPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "ForgetPasswordVC", sender: self)
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
                    UserData.setaccess_token(success?.accessToken)
                    UserData.setUSER_ID(success?.userID)
                    UserData.setUSER_ID("Email")
                    self.performSegue(withIdentifier: "imageSlider", sender: self)
                    
                }
                    
                    
                else if authError != nil {
                    ZKProgressHUD.dismiss()
                    self.error = authError?.errors.errorText ?? ""
                    self.performSegue(withIdentifier: "ErrorVC", sender: self)
                    print(authError?.errors.errorText)
                    
                }
                    
                else if error != nil{
                    ZKProgressHUD.dismiss()
                    print("error")
                    
                    
                }
                
            }
            
            
        }
        
        
    }
    
    
    private func facebookLogin () {
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            self.error = "Internet Connection Failed"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        case .online(.wwan), .online(.wiFi):
            //            ZKProgressHUD.show("Loading")
            let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
            
            fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
                if (error == nil) {
                    ZKProgressHUD.dismiss()
                    let fbloginresult : FBSDKLoginManagerLoginResult = result!
                    if(fbloginresult.isCancelled) {
                        //Show Cancel alert
                        ZKProgressHUD.dismiss()
                        print("cancelResult",fbloginresult.isCancelled)
                    }
                    else if (fbloginresult.grantedPermissions != nil){
                        ZKProgressHUD.dismiss()
                        if fbloginresult.grantedPermissions.contains("email"){
                            if FBSDKAccessToken.current != nil {
                                ZKProgressHUD.dismiss()
                                FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,id,picture.type(large),first_name,last_name"])
                                    .start(completionHandler: { (connection, result, error) -> Void in
                                        if error == nil{
                                            let dic = result as! [String:Any]
                                            print("Dic result",dic)
                                            
                                            guard let firstName = dic["first_name"] as? String else {return}
                                            guard let lastName = dic["last_name"] as? String else {return}
                                            guard let email = dic["email"] as? String else {return}
                                            let token = FBSDKAccessToken.current().tokenString
                                            print("Token",token)
                                            
                                            ZKProgressHUD.show("Loading")
                                            self.socialLogin(accesstoken: token ?? "", provider: "facebook", googleKey: "")
                                            
                                        }
                                        
                                    })
                            }
                        }
                        
                    }
                    
                    
                    
                }
            }
        }
        
    }
    
    
    
    private func socialLogin(accesstoken : String, provider:String, googleKey : String){
        
        SocialLoginManager.sharedInstance.socailLogin(access_token: accesstoken, provider: provider, google_key: googleKey) { (success, authError, error) in
            if success != nil {
                
                ZKProgressHUD.dismiss()
                print("Login Succesfull")
                UserData.setaccess_token(success?.accessToken)
                UserData.setUSER_ID(success?.userID)
                
                self.performSegue(withIdentifier: "imageSlider", sender: self)
            }
            else if authError != nil {
                
                ZKProgressHUD.dismiss()
                self.error = authError?.errors?.errorText ?? ""
                self.performSegue(withIdentifier: "ErrorVC", sender: self)
                print(authError?.errors?.errorText)
            }
            else if error != nil {
                ZKProgressHUD.dismiss()
                print("error")
            }
        }
        
        
    }
    
}

extension LoginController : GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            let userId = user.userID
            let idToken = user.authentication.accessToken
            print("user auth " ,idToken)
            let token = user.authentication.accessToken ?? ""
            socialLogin(accesstoken: token, provider: "google", googleKey: "AIzaSyDo-tKjkOFkb5yl2n_dxPNJngDdFWNrFMk")
        }
        else {
            ZKProgressHUD.dismiss()
            print(error.localizedDescription)
        }
        
    }
}






