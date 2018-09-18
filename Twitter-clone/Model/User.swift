//
//  User.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    let id: Int
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.id = Int(json["id"].stringValue)!
        self.name = json["name"].stringValue
        self.username = "@\(json["username"].stringValue)"
        self.bioText = json["bio_text"].stringValue
        self.profileImageUrl = json["profile_image"].stringValue
    }
    
}
