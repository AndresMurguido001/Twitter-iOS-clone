//
//  ApiService.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/4/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    let tron = TRON(baseURL: "http://localhost:3000")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasouce?, Error?) -> ()){
        let request: APIRequest<HomeDatasouce, JsonError> = tron.swiftyJSON.request("/users")
        request.perform(withSuccess: { (homeDataSource) in            
            completion(homeDataSource, nil)
        }) { (err) in
            completion(nil, err)
            print("Error fetching", err)
        }
    }
    func fetchUserFeed(id: Int, completion: @escaping(UserDataSource?, Error?) -> ()){
        let request: APIRequest<UserDataSource, JsonError> = tron.swiftyJSON.request("/users/\(id)")
        request.perform(withSuccess: { (userDataSource) in
            completion(userDataSource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    
    class JsonError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
}
