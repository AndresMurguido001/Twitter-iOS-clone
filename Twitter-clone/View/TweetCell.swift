//
//  TweetCell.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/30/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor : UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]))
            profileImageView.image = tweet.user.profileImage
            message.attributedText = attributedText
        }
    }
    
    let replyButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "reply-back").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let retweetBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let likeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let messageBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let message: UITextView = {
        let tv = UITextView()
        tv.text = "Some sample text to see"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "kramer")
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(message)

        
        message.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        message.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 4).isActive = true
        message.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 12).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        setupBottomButtons()
    }
    func setupBottomButtons(){
        let replyBtnContainer = UIView()
        
        let retweetBtnContainer = UIView()
        
        let likeBtnContainer = UIView()
        
        let messageBtnContainer = UIView()
        
        let buttonsStack = UIStackView(arrangedSubviews: [replyBtnContainer, retweetBtnContainer, likeBtnContainer, messageBtnContainer])
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis = .horizontal
        buttonsStack.distribution = .fillEqually
        
        addSubview(buttonsStack)
        addSubview(replyButton)
        addSubview(retweetBtn)
        addSubview(likeBtn)
        addSubview(messageBtn)
        
        buttonsStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttonsStack.leftAnchor.constraint(equalTo: message.leftAnchor).isActive = true
        buttonsStack.rightAnchor.constraint(equalTo: message.rightAnchor).isActive = true
        buttonsStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        replyButton.leftAnchor.constraint(equalTo: replyBtnContainer.leftAnchor).isActive = true
        replyButton.topAnchor.constraint(equalTo: replyBtnContainer.topAnchor).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        retweetBtn.leftAnchor.constraint(equalTo: retweetBtnContainer.leftAnchor).isActive = true
        retweetBtn.topAnchor.constraint(equalTo: retweetBtnContainer.topAnchor).isActive = true
        retweetBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        retweetBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        likeBtn.leftAnchor.constraint(equalTo: likeBtnContainer.leftAnchor).isActive = true
        likeBtn.topAnchor.constraint(equalTo: likeBtnContainer.topAnchor).isActive = true
        likeBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likeBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        messageBtn.leftAnchor.constraint(equalTo: messageBtnContainer.leftAnchor).isActive = true
        messageBtn.topAnchor.constraint(equalTo: messageBtnContainer.topAnchor).isActive = true
        messageBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        messageBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}












