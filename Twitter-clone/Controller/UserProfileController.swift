//
//  UserProfileController.swift
//  Twitter-clone
//
//  Created by andres murguido on 9/15/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class UserProfileController: DatasourceController {
    
    var userId = 0
    let userProfile = UserProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .yellow
        Service.sharedInstance.fetchUserFeed(id: userId) { (userDataSource, error) in
            self.datasource = userDataSource
            self.userProfile.usersProfile = userDataSource?.user
            self.setupView()
        }
    }
    func setupView(){
        view.addSubview(userProfile)
        
        userProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        userProfile.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        userProfile.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        userProfile.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        if let cv = collectionView {
            cv.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height / 4) - 10).isActive = true
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            cv.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            cv.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            cv.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let tweet = self.datasource?.item(indexPath) as? Tweet {
            let estimatedHeight = estimatedSize(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 90)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedSize(_ text: String) -> CGFloat {
        let apprxWidthBioText = view.frame.width - 12 - 50 - 16
        let size = CGSize(width: apprxWidthBioText, height: 1000)
        let attr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil)
        return estimatedFrame.height
    }
    
}
