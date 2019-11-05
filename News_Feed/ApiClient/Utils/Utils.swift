//
//  Utils.swift
//  News_Feed
//
//  Created by MBE For You on 2019-10-22.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation

public struct APIClient {
 public static let baseURl = "https://demo.wowonder.com/api"
    
    public struct Get_News_Feed {
        public static let get_News_Feed_Posts = "\(baseURl)/posts"
        
    }
    
    public struct Params {
        
        public static let serverKey = "server_key"
        public static let type = "type"
        public static let limit = "limit"
        
        
    }
    
    public struct SERVER_KEY {
    public  static var Server_Key = "131c471c8b4edf662dd0ebf7adf3c3d7365838b9"
      
    }
    
    
    


}




