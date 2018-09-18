//
//  UserProfile.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/15/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit
import LBTAComponents

class UserProfile: UIView {
    
    var usersProfile: Any? {
        didSet {
            print("USER SET")
            guard let currentUser = usersProfile as? User else { return }
            imageView.loadImage(urlString: currentUser.profileImageUrl)
        }
    }
//
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
//
    let userDetails: UIView = {
       let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let imageView: CachedImageView = {
        let iv = CachedImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 8.0
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(userDetails)
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: userDetails.bottomAnchor, constant: -100).isActive = true
        imageView.leftAnchor.constraint(equalTo: userDetails.leftAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        userDetails.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        userDetails.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25).isActive = true
        userDetails.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        userDetails.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
}
