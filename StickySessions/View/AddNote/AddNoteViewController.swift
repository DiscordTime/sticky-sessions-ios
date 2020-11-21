//
//  AddNoteViewController.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import RxSwift

class AddNoteViewController: UIViewController, UIPickerViewDataSource,
                             UIPickerViewDelegate {
    
    @IBOutlet weak var textViewNoteDescription: UITextViewPH!
    @IBOutlet weak var pickerViewTopics: UIPickerView!
    private let disposeBag = DisposeBag()
    
    var addNoteViewModel: AddNoteViewModel?
    var sessionViewModel: SessionViewModel?
    
    var topics: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create Note"
        
        topics = sessionViewModel!.topics
        addNoteViewModel = AddNoteViewModel()
        
        pickerViewTopics.dataSource = self
        pickerViewTopics.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return topics.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            return NSAttributedString(string: topics[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    }
    
    @IBAction func addNoteClicked(_ sender: Any) {
        let desc = textViewNoteDescription.text ?? ""
        if desc.isEmpty {
            showEmptyDescriptionWarning()
            return
        }
        
        let topic = topics[pickerViewTopics.selectedRow(inComponent: 0)]
        print("Selected topic: ", topic)
        print("Note description: ", desc)
        
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
    
    private func showEmptyDescriptionWarning() {
        print("Cannot add empty text note.")
        let dialogMessage = UIAlertController(title: "Empty note", message: "Please add a description to your note", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            dialogMessage.dismiss(animated: true, completion: nil)
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }

}
