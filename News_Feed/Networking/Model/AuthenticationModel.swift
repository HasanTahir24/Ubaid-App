//
//  AuthenticationModel.swift
//  News_Feed
//
//  Created by MBE For You on 2019-11-08.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation
class AuthenticationModel {
    
    struct LoginAuth_SuccessModel : Codable {
    let apiStatus: Int
        let timezone, accessToken, userID: String

        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case timezone
            case accessToken = "access_token"
            case userID = "user_id"
        }
    }
    
    
    struct LoginAuth_ErrorModel: Codable {
        let apiStatus: String
        let errors: Errors

        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }

    // MARK: - Errors
    struct Errors: Codable {
        let errorID: Int
        let errorText: String

        enum CodingKeys: String, CodingKey {
            case errorID = "error_id"
            case errorText = "error_text"
        }
    }
    
  
    struct SignUp_SuccessModel : Codable {
    let apiStatus: Int
    let accessToken, userID: String

    enum CodingKeys: String, CodingKey {
        case apiStatus = "api_status"
        case accessToken = "access_token"
        case userID = "user_id"
    }
        
        
    }
    
    struct SignUp_ErrorModel : Codable {
        let apiStatus: String
        let errors: Errors

        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }
    
    struct SocialLogin_SuccessModel : Codable {
        let apiStatus: Int?
        let timezone, accessToken, userID: String?
        
        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case timezone
            case accessToken = "access_token"
            case userID = "user_id"
        }
    }
    
    
    struct SocialLogin_ErrorModel : Codable {
        let apiStatus: String?
        let errors: Errors?
        
        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }
    
    
    
    
    
    
}
