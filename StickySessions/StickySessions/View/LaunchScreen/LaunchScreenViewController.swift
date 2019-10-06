//
//  LaunchScreenViewController.swift
//  StickySessions
//
//  Created by Patrick Steiger on 04/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class LaunchScreenViewController : UIViewController, UITextFieldDelegate {

    static let LIST_SESSIONS_SEGUE_ID: String = "listSessionsShowNextSegueId"
    static let LOGIN_SEGUE_ID: String = "loginShowSegueId"

    var firebaseAuthStateListener: AuthStateDidChangeListenerHandle?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        // We can use an auth state change listener like this in other viewControllers to
        // get the user
        firebaseAuthStateListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            print (user?.displayName ?? "no user")
            
            if let user = user {
                print ("user = " + (user.displayName ?? ""))
                self.loadNextViewController()
            } else {
                self.loadLoginViewController()
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: LaunchScreenViewController.LIST_SESSIONS_SEGUE_ID, sender: nil)
    }

    func loadLoginViewController() {
        self.performSegue(withIdentifier: LaunchScreenViewController.LOGIN_SEGUE_ID, sender: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(firebaseAuthStateListener!)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance()?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
