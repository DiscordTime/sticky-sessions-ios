//
//  AddNoteViewController.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    var sessionId: String = ""
    var userName: String = ""
    var desc: String = ""
    var topic: String = ""
    var sessionName: String = ""
    var addNoteViewModel: AddNoteViewModel?
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var topicPicker: UIPickerView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topicPicker.delegate = self
        self.topicPicker.dataSource = self
        if sessionName == "Starfish" {
            pickerData = ["Start", "Stop", "Keep", "Less", "More"]
        } else {
            pickerData = ["Gain & Pleasure", "Gain & Pain", "Loss & Pleasure", "Loss & Pain"]
        }
        topic = pickerData[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        topic = pickerData[row]
    }
    
    @IBAction func addNoteClicked(_ sender: Any) {
        desc = descriptionTextField.text ?? ""
        
        addNoteViewModel = AddNoteViewModel(sessionId: sessionId,
                                            userName: userName,
                                            desc: desc,
                                            topic: topic)
        
        addNoteViewModel?.addNote()
        self.navigationController?.popViewController(animated: true)
    }
}
