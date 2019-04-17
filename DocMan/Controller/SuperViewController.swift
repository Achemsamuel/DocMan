//
//  SuperViewController.swift
//  DocMan
//
//  Created by Achem Samuel on 4/17/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class SuperViewController: UIViewController, GIDSignInDelegate {
    

    //let facebookLoginButton = FBSDKLoginButton()
    let dashBoardSegueIdentifier = "goToDashboard"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        //facebookLoginButton.delegate = self
        
    }
    

   

}

extension SuperViewController : GIDSignInUIDelegate  {
    
    func signInDelegate () {
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out :\(signOutError)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       
    }
    
}

extension SuperViewController : FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
