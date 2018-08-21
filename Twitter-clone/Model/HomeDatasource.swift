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
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
}


