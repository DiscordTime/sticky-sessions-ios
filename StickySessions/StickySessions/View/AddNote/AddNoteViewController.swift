//
//  AddNoteViewController.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    var sessionId: String = ""
    var userName: String = ""
    var desc: String = ""
    var topic: String = ""
    
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var addNoteViewModel: AddNoteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNoteClicked(_ sender: Any) {
        topic = topicTextField.text ?? ""
        desc = descriptionTextField.text ?? ""
        
        addNoteViewModel = AddNoteViewModel(sessionId: sessionId,
                                            userName: userName,
                                            desc: desc,
                                            topic: topic)
        
        addNoteViewModel?.addNote()
    }
}
