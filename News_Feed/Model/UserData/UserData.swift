//
//  File.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-11.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation

class UserData {
    
    static let preference = UserDefaults.standard
    static fileprivate let USER_NAME: String = "USER_NAME"
    static fileprivate let USER_EMAIL: String = "USER_EMAIL"
    static fileprivate let USER_ID: String = "USER_ID"
    static fileprivate let Access_token: String = "Access_token"

   
    
    
    
    
   
    static func setUSER_ID(_ userId: String?){
        preference.setValue(userId, forKey: USER_ID )
        preference.synchronize()
    }
    
    static func setaccess_token(_ token: String?){
           preference.setValue(token, forKey: Access_token )
           preference.synchronize()
       }
    
    
    static func setUSER_NAME(_ userName: String?){
        preference.setValue(userName, forKey: USER_NAME )
        preference.synchronize()
    }
    static func setUser_Email(_ userEmail: String?){
        preference.setValue(userEmail, forKey: USER_EMAIL )
        preference.synchronize()
    }
    static func getUSER_NAME() -> String?{
        return preference.string(forKey: USER_NAME)
    }
    static func getUSER_EMAIL() -> String?{
        return preference.string(forKey: USER_EMAIL)
    }
    static func getUSER_ID() -> String?{
        return preference.string(forKey: USER_ID)
    }
    static func getAccess_Token() -> String?{
           return preference.string(forKey: Access_token)
       }
    
    
    
    static func clear(){
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        preference.synchronize()
        
    }
    
    
    
    
    
    
}
