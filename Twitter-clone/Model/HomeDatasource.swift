//
//  HomeDatasource.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents


class HomeDatasouce: Datasource {
    
    var users = [User]()
    
//        let andresUser = User(name: "Andres", username: "@dreGuido", bioText: "Programming everyday", profileImage: #imageLiteral(resourceName: "user"))
//        let ray = User(name: "Ray Wenderlich", username: "@ray", bioText: "Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software, gaming, Tweets on programming, software", profileImage: #imageLiteral(resourceName: "user"))
//        
//        return [andresUser, ray]
//    }()
    override init() {
        super.init()
        fetchUserFeed()
    }
    
    func fetchUserFeed(){
        ApiService.sharedInstance.fetchTweets {
            self.users = ApiService.sharedInstance.users
        }

    }

    let tweets: [Tweet] = {
        let tweet = Tweet(user: User(name: "Kramer", username: "@kramer", bioText: "Im Kramer", profileImage: #imageLiteral(resourceName: "kramer")), message: "Little Jerry won another cockfight today!")
        let tweet2=Tweet(user: User(name: "Jerry", username: "JerrySeinfeld", bioText: "Comedian from new york!", profileImage: #imageLiteral(resourceName: "jerry")), message: "Little jerry is my hero!")
        let tweet3 = Tweet(user: User(name: "George", username: "GeorgieBoy", bioText: "I have no job, no money, and I live with my parents", profileImage: #imageLiteral(resourceName: "George")), message: "TAMALES! Little jerry ass. I won $1000. Good thing I killed susan")

       return [tweet, tweet2, tweet3]
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


