//
//  ForgetPasswordModel.swift
//  News_Feed
//
//  Created by clines329 on 11/15/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation

class ForgetPasswordModel {
    
    struct forgetPasswordSuccessModel : Codable {
        let api_status = Int
    }
    
    
    struct forgetPasswordErrorModel: Codable {
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
    
    
}

