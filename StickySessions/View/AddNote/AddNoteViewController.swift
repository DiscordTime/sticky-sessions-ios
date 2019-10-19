//
//  AddNoteViewController.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import RxSwift

class AddNoteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private let disposeBag = DisposeBag()

    var userName: String = ""
    var desc: String = ""
    var topic: String = ""
    var addNoteViewModel: AddNoteViewModel?
    var sessionViewModel: SessionViewModel?
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var topicPicker: UIPickerView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topicPicker.delegate = self
        self.topicPicker.dataSource = self
        
        pickerData = sessionViewModel!.topics
        topic = pickerData[0]

        addNoteViewModel = AddNoteViewModel()
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
        
        addNoteViewModel?.addNote(sessionId: sessionViewModel!.id,
                                  desc: desc,
                                  topic: topic)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { note in
                    self.success(note: note)
            },
                onError: { error in
                    self.fail(errorMsg: error.localizedDescription)
            })
            .disposed(by: disposeBag)

        self.navigationController?.popViewController(animated: true)
    }

    func success(note: Note) {
        print("Note Added: ", note)
    }

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }

}
