//
//  HomeDatasource.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasouce: Datasource, JSONDecodable {
    // Users coming from APIService
    let users: [User]
    let tweets: [Tweet]
    required init(json: JSON) throws {

        var tweets = [Tweet]()
        let userJsonArray = json.array
        self.users = userJsonArray!.map({ return User(json: $0)})
        
        for userJson in userJsonArray! {
            let user = User(json: userJson)
            let usersTweets = userJson["tweets"].array
            for tweet in usersTweets! {
                let message = tweet["message"].stringValue
                let newTweet = Tweet(user: user, message: message)
                tweets.append(newTweet)
            }

        }
        self.tweets = tweets
    }
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    override func numberOfSections() -> Int {
        return 2
    }
}


