//
//  HomeDatasourceController.swift
//  Twitter-clone
//
//  Created by andres murguido on 8/20/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, something went wrong. Please try refreshing the page"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        setupNavigationBarItems()
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, error) in
            if let err = error {
                self.errorMessageLabel.isHidden = false
                if let apiError = err as? APIError<Service.JsonError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status Code is not 200!"
                    }
                }
                return
            }
            self.datasource = homeDataSource
        }
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
    }
    func setupNavigationBarItems() {
        
        setupRightNavItems()
        setupLeftNavButtonItems()
        setupRemainingNav()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if let user = self.datasource?.item(indexPath) as? User {
                //using user.biotext, get estimation of height
                let estimatedHeight = estimatedSize(user.bioText)
                return CGSize(width: view.frame.width, height: estimatedHeight + 60)
            }
        } else if indexPath.section == 1 {
            if let tweet = self.datasource?.item(indexPath) as? Tweet {
               let estimatedHeight = estimatedSize(tweet.message)
                return CGSize(width: view.frame.width, height: estimatedHeight + 90)
            }
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








