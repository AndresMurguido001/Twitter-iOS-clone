//
//  UserCell.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioText.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "user")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Andres Murguido"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@dreGuido"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 124, g: 131, b: 139)
        return label
    }()
    
    let bioText: UITextView = {
        let tv = UITextView()
        tv.text = "Lorem ipsum dolor amet listicle thundercats beard church-key iPhone tumeric asymmetrical. Umam"
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.backgroundColor = .clear
        return tv
    }()
    
    let followButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.layer.borderColor = twitterBlue.cgColor
        btn.layer.borderWidth = 1
        btn.setTitle("Follow", for: .normal)
        btn.setTitleColor(twitterBlue, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(bioText)
        addSubview(followButton)
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        followButton.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        followButton.bottomAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: -8).isActive = true
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioText.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}









