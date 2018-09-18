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

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map({try T(json: $0)})
        
    }
}

class HomeDatasouce: Datasource, JSONDecodable {
    // Users coming from APIService
    let users: [User]
    let tweets: [Tweet]
    required init(json: JSON) throws {
        guard let userJsonArray = json.array else {
            throw NSError(domain: "localhost:3000", code: 500, userInfo: [NSLocalizedDescriptionKey : "Something went wrong hitting rails api, and getting Users JSON Array"])
        }
        self.users = userJsonArray.map({ return User(json: $0)})
        
        for userJson in userJsonArray {
            guard userJson["tweets"].array != nil else {
                throw NSError(domain: "localhost:3000", code: 500, userInfo: [NSLocalizedDescriptionKey : "Something went wrong hitting rails api, and hitting Tweets api"])
            }
            
        }
        
        let nonEmptyTweets = userJsonArray.filter({ $0["tweets"].count > 0 })
        let userTweets = nonEmptyTweets.map { (json) -> Tweet in
            let user = User(json: json)
            let latestTweet = json["tweets"][0]
            return Tweet(user: user, message: latestTweet["message"].stringValue)
        }
        
        self.tweets = userTweets
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


