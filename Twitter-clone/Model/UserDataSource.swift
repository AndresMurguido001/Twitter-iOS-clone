//
//  UserDataSource.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/17/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class UserDataSource: Datasource, JSONDecodable {
    // Individual User Profile coming from APIService
    let user: User
    let tweets: [Tweet]
    required init(json: JSON) throws {
        let selectedUser = User(json: json)
        // Loop through individual users tweets
        self.user = selectedUser
        
        guard let userTweets = json["tweets"].array else {
            throw NSError(domain: "localhost:3000", code: 500, userInfo: [NSLocalizedDescriptionKey : "Something went wrong hitting rails api, and getting Users JSON Array"])
        }
        let nonEmptyTweets = userTweets.filter({ $0.count > 0 })
        let usersCurrentTweets = nonEmptyTweets.map { (tweet) -> Tweet in
            
            return Tweet(user: selectedUser, message: tweet["message"].stringValue)
        }
        self.tweets = usersCurrentTweets
        
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return tweets.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return tweets[indexPath.item]
    }
    
}



