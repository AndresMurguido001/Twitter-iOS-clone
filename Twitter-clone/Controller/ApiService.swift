//
//  ApiService.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/4/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    let baseUrl = "http://localhost:3000/users"
    
    func fetchTweets(){
        Alamofire.request(baseUrl).responseJSON { (response) in
            if response.result.value != nil {
                let swifty = JSON(response.result.value)
                var userInfo: [String: Any]
                for user in swifty {
                    print(user)
                }
                
            }
        }
    }
}
