//
//  NewTweetController.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/14/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

class NewTweetController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
        view.backgroundColor = .white
        setupViews()
        print("Setup New Tweets Controller")
    }
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.backgroundColor = .red
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Text to add new tweet"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupViews(){
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        self.textView.resignFirstResponder()
        self.textView.becomeFirstResponder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
