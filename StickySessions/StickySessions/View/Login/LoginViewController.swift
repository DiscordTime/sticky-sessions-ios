//
//  LoginViewController.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 06/10/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    static let SEGUE_ID: String = "listSessionsShowNextSegueId"
    var firebaseAuthStateListener: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firebaseAuthStateListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            print (user?.displayName ?? "no user")
            
            if let user = user {
                print ("user = " + (user.displayName ?? ""))
                self.loadNextViewController()
                self.removeSpinner()
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        self.showSpinner(onView: self.view)
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: LoginViewController.SEGUE_ID, sender: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(firebaseAuthStateListener!)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {

        if let error = error {
            print(error)
            self.removeSpinner()
            return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error)
                self.removeSpinner()
                return
            }
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

}
