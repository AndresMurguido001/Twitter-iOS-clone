//
//  Cells.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserHeader: DatasourceCell {
    let textLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Who To Follow"
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Show me more"
        lbl.textColor = twitterBlue
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let whiteBackground: UIView = {
       let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(whiteBackground)
        addSubview(textLabel)
        whiteBackground.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        whiteBackground.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        whiteBackground.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        whiteBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
//        backgroundColor = .white
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

