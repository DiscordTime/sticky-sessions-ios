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

class AddNameViewController : UIViewController,UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {

    static let SEGUE_ID: String = "addNameShowNextSegueId"

    @IBOutlet weak var nameField: UITextField!

    var addNameViewModel: AddNameViewModel!
    var btnSignIn : GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addNameViewModel = AddNameViewModel()
        nameField.delegate = self
        initAuth()
        createSignIn()
    }
    func initAuth()
    {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }

    func loadNextViewController() {
        self.performSegue(withIdentifier: AddNameViewController.SEGUE_ID, sender: nil)
    }

    @IBAction func enterButtonClicked(_ sender: Any) {
        loadNextViewController()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        addNameViewModel.saveUserName(userName: textField.text ?? "No one")
    }

    func createSignIn() {
        GIDSignIn.sharedInstance().signOut()
        btnSignIn = GIDSignInButton()
        btnSignIn.center = view.center
        btnSignIn.style = GIDSignInButtonStyle.standard
        view.addSubview(btnSignIn)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AddNameViewController.receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                                  object: nil)
    }

    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        print("receiveToggleAuthUINotification")
        if notification.name.rawValue == "ToggleAuthUINotification" {
           // self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                //self.statusText.text = userInfo["statusText"]!
                addNameViewModel.saveUserName(userName: userInfo["Name"] ?? "No Name" )
                loadNextViewController()
            }
        }
    }



    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let fullName = user.profile.name
            let givenName = user.profile.givenName


            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)


            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
                    // ...
                    return
                }
                // User is signed in
                // ...
                NotificationCenter.default.post(
                    name: Notification.Name(rawValue: "ToggleAuthUINotification"),
                    object: nil,
                    userInfo: [ "Name": givenName ?? "No name",
                                "fullName" : fullName ?? "No Name"])
            }
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
