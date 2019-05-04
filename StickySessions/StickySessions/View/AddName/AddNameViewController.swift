//
//  AddName.swift
//  StickySessions
//
//  Created by Patrick Steiger on 04/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class AddNameViewController : UIViewController {
    
    static let SEGUE_ID: String = "addNameShowNextSegueId"
    
    var addNameViewModel: AddNameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNameViewModel = AddNameViewModel()
    }
    
    func loadNextViewController() {
        self.performSegue(withIdentifier: AddNameViewController.SEGUE_ID, sender: nil)
    }
    
    @IBAction func nameTextEditingEnded(_ sender: UITextField) {
        addNameViewModel.saveUserName(userName: sender.text ?? "No one")
    }
    
    @IBAction func enterButtonClicked(_ sender: Any) {
        loadNextViewController()
    }
    //    @IBAction func nameTextEditingEnded(_ sender: UITextField) {
//        addNameViewModel.saveUserName(userName: sender.text ?? "No one")
//    }
//
//    @IBAction func enterButtonClicked(_ sender: Any) {
//        loadNextViewController()
//    }
    
}
