//
//  SignUpViewController.swift
//  DocMan
//
//  Created by Achem Samuel on 4/17/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class SignUpViewController: SuperViewController {

    
    /*
     Variables and Instances
     */
    
    
    /*
     Life Cycle
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        buttonSetUp()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance()?.signOut()
        super.signOut()
        //loginButtonDidLogOut(facebookButton)
    }
    
    
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    @IBOutlet weak var googleButton: GIDSignInButton!
    @IBOutlet weak var gitButton: GIDSignInButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    func buttonSetUp () {
        
        //let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 25.0
        
        facebookButton.backgroundColor = UIColor.clear
        facebookButton.layer.borderWidth = 1.0
        facebookButton.layer.borderColor = UIColor(red: 0.007, green: 0.54, blue: 1, alpha: 1).cgColor
        facebookButton.layer.cornerRadius = cornerRadius
        
        googleButton.backgroundColor = UIColor.clear
        googleButton.layer.borderWidth = 1.0
        googleButton.layer.borderColor = UIColor(red: 0.9, green: 0.22, blue: 0.2, alpha: 1).cgColor
        googleButton.layer.cornerRadius = cornerRadius
        
        gitButton.backgroundColor = UIColor.clear
        gitButton.layer.borderWidth = 1.0
        gitButton.layer.borderColor = UIColor(red: 0.32, green: 0.32, blue: 0.32, alpha: 1).cgColor
        gitButton.layer.cornerRadius = cornerRadius
        
        signUpButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: GIDSignInButton) {
        super.signInDelegate()
       
    }
    
    @IBAction func facebookLoginButonPressed(_ sender: UIButton) {
        facebookButton.delegate = self
    }
    
    @IBAction func gitLoginButtonPressed(_ sender: UIButton) {
        
    }
    
}

extension SignUpViewController {
    
    override func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            
            print("Error could not sign in user: \(error.localizedDescription)")
            return
        }
        guard let authentication = user.authentication else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            
            if error != nil {
                print("Error, could not authenticate user :\(error?.localizedDescription)")
                
                return
            } else {
                print("User is signed In")
                self.performSegue(withIdentifier: super.dashBoardSegueIdentifier, sender: self)
            }
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("User discnnected from app : \(error.localizedDescription)")
    }
    
    /*
     Facebook Sign In Implementation
     */
    override func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if  error != nil {
            print("Error :\(error.localizedDescription)")
            return
        } else {
            print("User successfully logged in with facebook")
            self.performSegue(withIdentifier: super.dashBoardSegueIdentifier, sender: self)
        }
//        let credential = FacebookAuthProvider.credential(withAccessToken: (FBSDKAccessToken.current()?.tokenString)!)
//
//        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
//            if error != nil {
//                print("Could not authenticate user :\(String(describing: error?.localizedDescription))")
//            } else {
//                print("User is signed in via FB")
//                self.performSegue(withIdentifier: super.dashBoardSegueIdentifier, sender: self)
//            }
//        }
        
    }
    
    override func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Loggd out")
    }
}
