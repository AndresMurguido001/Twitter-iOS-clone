//
//  HomeDatasource.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents

class HomeDatasouce: Datasource {
    //build api helper to populate model with users from rails api
    let users: [User] = {
        let andresUser = User(name: "Andres", username: "@dreGuido", bioText: "Programming everyday", profileImage: #imageLiteral(resourceName: "user"))
        let ray = User(name: "Ray Wenderlich", username: "@ray", bioText: "Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software", profileImage: #imageLiteral(resourceName: "user"))
        
        return [andresUser, ray]
    }()
    
    let tweets: [Tweet] = {
        let tweet = Tweet(user: User(name: "Kramer", username: "@kramer", bioText: "Im Kramer", profileImage: #imageLiteral(resourceName: "kramer")), message: "Little Jerry won another cockfight today!")
       return [tweet]
    }()
    
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


