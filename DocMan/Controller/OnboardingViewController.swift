//
//  OnboardingViewController.swift
//  DocMan
//
//  Created by Achem Samuel on 4/18/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    let collectionViewCellIdentifier = "onboardingCollectionCell"
    let goToLoginScreenIdentifier = "goToLoginScreen"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonSetUp()
    }
    
    @IBOutlet weak var continueToLogin: UIButton!
    @IBOutlet weak var slideRightForMore: UILabel!
    
    @IBAction func continueToLoginButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToLoginScreenIdentifier, sender: self)
    }
    
    func buttonSetUp () {
        continueToLogin.layer.cornerRadius = 10.0
        continueToLogin.isHidden = true
    }
    

}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as? OnboardingCollectionViewCell {
            
            switch indexPath.item {
                case 0:
                //cell.onboardingImageView.image = UIImage(named: "3")
                self.slideRightForMore.isHidden = false
                return cell
            case 1:
                cell.topLabel.text = "Who can use it"
                self.slideRightForMore.isHidden = false
                return cell
            case 2:
                cell.topLabel.text = "What can you do with it"
                self.continueToLogin.isHidden = false
                self.slideRightForMore.isHidden = true
                return cell
            default:
                return cell
            }
            
            }
            return UICollectionViewCell()
        }
    
    
}
