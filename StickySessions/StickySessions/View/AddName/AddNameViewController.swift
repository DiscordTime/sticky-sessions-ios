//
//  AddName.swift
//  StickySessions
//
//  Created by Patrick Steiger on 04/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class AddNameViewController : UIViewController, UITextFieldDelegate, GIDSignInUIDelegate {

    static let SEGUE_ID: String = "addNameShowNextSegueId"

    @IBOutlet weak var logo: UIImageView!

    var btnSignIn : GIDSignInButton!
    var firebaseAuthStateListener: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }

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
                self.createSignInButton()
            }
        }
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: AddNameViewController.SEGUE_ID, sender: nil)
    }
    
    func createSignInButton() {
        logo?.removeFromSuperview()
        btnSignIn = GIDSignInButton()
        btnSignIn.center = view.center
        btnSignIn.style = GIDSignInButtonStyle.standard
        view.addSubview(btnSignIn)
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
