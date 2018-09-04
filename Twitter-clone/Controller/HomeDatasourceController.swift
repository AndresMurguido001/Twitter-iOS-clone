//
//  HomeDatasourceController.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        let homeDatasouce = HomeDatasouce()
        self.datasource = homeDatasouce
        ApiService().fetchTweets()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
    }
    func setupNavigationBarItems() {
        
        setupRightNavItems()
        setupLeftNavButtonItems()
        setupRemainingNav()
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            //using user.biotext, get estimation of height
            let apprxWidthBioText = view.frame.width - 12 - 50 - 16
            let size = CGSize(width: apprxWidthBioText, height: 1000)
            let attr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 60)
        }
        if let tweet = self.datasource?.item(indexPath) as? Tweet {
            let apprxWidthBioText = view.frame.width - 12 - 50 - 16
            let size = CGSize(width: apprxWidthBioText, height: 1000)
            let attr = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: tweet.user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 70)
        }
        
        
        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}








