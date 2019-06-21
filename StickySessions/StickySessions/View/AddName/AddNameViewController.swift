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

    @IBOutlet weak var nameField: UITextField!

    var btnSignIn : GIDSignInButton!
    var firebaseAuthStateListener: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        createSignInButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        // We can use an auth state change listener like this in other viewControllers to
        // get the user
        firebaseAuthStateListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            print (user?.displayName ?? "no user")
            
            if let user = user {
                print ("user = " + (user.displayName ?? ""))
                self.loadNextViewController()
            }
        }
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: AddNameViewController.SEGUE_ID, sender: nil)
    }

    @IBAction func enterButtonClicked(_ sender: Any) {
        loadNextViewController()
    }
    
    func createSignInButton() {
        btnSignIn = GIDSignInButton()
        btnSignIn.center = view.center
        btnSignIn.style = GIDSignInButtonStyle.standard
        view.addSubview(btnSignIn)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(firebaseAuthStateListener!)
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
