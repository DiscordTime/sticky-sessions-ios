//
//  AddName.swift
//  StickySessions
//
//  Created by Patrick Steiger on 04/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class AddNameViewController : UIViewController, UITextFieldDelegate {
    
    static let SEGUE_ID: String = "addNameShowNextSegueId"
    
    @IBOutlet weak var nameField: UITextField!

    var addNameViewModel: AddNameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNameViewModel = AddNameViewModel()
        nameField.delegate = self
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
    
}
