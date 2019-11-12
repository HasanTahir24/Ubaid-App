//
//  SocialLoginManager.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-12.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation
import Alamofire

class SocialLoginManager{
    
    func socailLogin(access_token:String,provider:String,google_key:String,completionBlock : @escaping (_ Success:AuthenticationModel.SocialLogin_SuccessModel?, _ AuthError : AuthenticationModel.SocialLogin_ErrorModel?, Error?)->()){
        
        let params = [APIClient.Params.accessToken : access_token, APIClient.Params.provider : provider,APIClient.Params.googleKey : google_key,APIClient.Params.serverKey : APIClient.SERVER_KEY.Server_Key]
        
        Alamofire.request(APIClient.SocialLogin.socailLoginApi, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.value != nil {
                guard let res = response.result.value as? [String:Any] else {return}
                guard let apiStatusCode = res["api_status"]  as? Any else {return}
                let apiCode = apiStatusCode as? Int
                if apiCode == 200 {
                    guard let allData = try? JSONSerialization.data(withJSONObject: response.value, options: [])else {return}
                    guard let result = try? JSONDecoder().decode(AuthenticationModel.SocialLogin_SuccessModel.self, from: allData) else {return}
                    completionBlock(result,nil,nil)
                    
                }
                    
                else {
                    guard let allData = try? JSONSerialization.data(withJSONObject: response.value, options: [])else {return}
               print(response.value)     
                    guard let result = try? JSONDecoder().decode(AuthenticationModel.SocialLogin_ErrorModel.self, from: allData) else {return}
                    completionBlock(nil,result,nil)
                    
                    
                }
                
                
                
            }
                
            else {
                print(response.error?.localizedDescription)
                completionBlock(nil,nil,response.error)
            }
            
            
            
        
        }
        
        
        
        
        
    }
    
    
   static let sharedInstance = SocialLoginManager()
    private init() {}
    
    
    
}
