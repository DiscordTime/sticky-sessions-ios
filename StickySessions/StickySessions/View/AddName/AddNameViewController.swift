//
//  AddName.swift
//  StickySessions
//
//  Created by Patrick Steiger on 04/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseUI

class AddNameViewController : UIViewController, UITextFieldDelegate, GIDSignInUIDelegate {

    static let SEGUE_ID: String = "addNameShowNextSegueId"

    @IBOutlet weak var nameField: UITextField!

    var addNameViewModel: AddNameViewModel!
    var btnSignIn : GIDSignInButton!
    //var authFB : FirebaseAuth!


    override func viewDidLoad() {
        super.viewDidLoad()
        addNameViewModel = AddNameViewModel()
        nameField.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        createSignIn()
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
    //    @IBAction func nameTextEditingEnded(_ sender: UITextField) {
//        addNameViewModel.saveUserName(userName: sender.text ?? "No one")
//    }
//
//    @IBAction func enterButtonClicked(_ sender: Any) {
//        loadNextViewController()
//    }
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
}
