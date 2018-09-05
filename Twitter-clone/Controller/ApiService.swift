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
    var users = [User]()
    
    
    func fetchTweets(completion: @escaping () -> ()){
        Alamofire.request(baseUrl).responseJSON { (response) in
            if response.result.value != nil {
                let swifty = JSON(response.result.value).array

                for value in swifty! {
                    
                    let name = value["name"].stringValue
                    let username = value["username"].stringValue
                    let bioText = value["bio_text"].stringValue
                    let profileImage = value["profile_image"].stringValue

                    let user = User(name: name, username: username, bioText: bioText, profileImage: UIImage())
                    self.users.append(user)
                }
                
                completion()
            }
        }
    }
    func fetchUserImg(url: String) {
        
    }
}
