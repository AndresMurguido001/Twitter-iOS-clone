//
//  HomeDataSourceControllerEXT.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/29/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

extension HomeDatasourceController: UISearchBarDelegate {
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
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        let navBarSeperatorView = UIView()
        navBarSeperatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        navBarSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarSeperatorView)
        navBarSeperatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBarSeperatorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navBarSeperatorView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navBarSeperatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
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
        searchBtn.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        compose.addTarget(self, action: #selector(handleCompose), for: .touchUpInside)
    }
    
    
    
    @objc func handleCompose(){
        let newController = NewTweetController()
        if let navigation = self.navigationController {
            self.dismiss(animated: false, completion: nil)
            navigation.pushViewController(newController, animated: true)
        }
    }
    
    
    @objc func handleSearch(){
        let searchBar = UISearchBar()
        view.addSubview(searchBar)
        searchBar.alpha = 0
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.5, animations: {
            searchBar.showsCancelButton = true
            searchBar.alpha = 1
        }) { (finished) in
            searchBar.becomeFirstResponder()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.5, animations: {
            searchBar.alpha = 0
            self.setupNavigationBarItems()
        }) { (finished) in
            
        }
    }
    
}






