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

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    static let SEGUE_ID: String = "listSessionsShowNextSegueId"
    var firebaseAuthStateListener: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self

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
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: LoginViewController.SEGUE_ID, sender: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(firebaseAuthStateListener!)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
