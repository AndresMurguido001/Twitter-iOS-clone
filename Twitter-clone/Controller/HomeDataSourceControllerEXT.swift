//
//  HomeDataSourceControllerEXT.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/29/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    func setupLeftNavButtonItems(){
        let followBtn = UIButton(type: .system)
        followBtn.setImage(#imageLiteral(resourceName: "follower").withRenderingMode(.alwaysOriginal), for: .normal)
        followBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        followBtn.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followBtn)
    }
    func setupRemainingNav() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "twitter"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    func setupRightNavItems(){
        let searchBtn = UIButton(type: .system)
        searchBtn.setImage(#imageLiteral(resourceName: "magnifying-glass-browser").withRenderingMode(.alwaysOriginal), for: .normal)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchBtn.contentMode = .scaleAspectFit
        let compose = UIButton(type: .system)
        compose.setImage(#imageLiteral(resourceName: "feather").withRenderingMode(.alwaysOriginal), for: .normal)
        compose.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        compose.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: compose), UIBarButtonItem(customView: searchBtn)]
    }
}
