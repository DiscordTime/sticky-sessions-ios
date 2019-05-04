//
//  File.swift
//  StickySessions
//
//  Created by Patrick Steiger on 03/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class AddNameViewController : UIViewController {
    
    var addNameViewModel: AddNameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNameViewModel = AddNameViewModel()
    }
    
    func loadNextViewController() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "ListSessions", bundle:nil)
        
        let listSessionsViewController = storyBoard.instantiateViewController(withIdentifier: "listSessionsViewControllerScene")
        
        self.present(listSessionsViewController, animated:true, completion:nil)
    }
    
    @IBAction func nameTextEditingEnded(_ sender: UITextField) {
        addNameViewModel.saveUserName(userName: sender.text ?? "No one")
    }
    
    @IBAction func enterButtonClicked(_ sender: Any) {
        loadNextViewController()
    }
    
}
