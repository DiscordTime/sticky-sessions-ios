//
//  ShowSessionViewController.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/3/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import RxSwift

class ShowSessionViewController: UICollectionViewController {

    private let disposeBag = DisposeBag()

    static let SEGUE_ID = "showSessionShowNextSegueId"
    var sessionViewModel: SessionViewModel?
    var notesViewModel: [NoteViewModel] = []
    var showSessionViewModel: ShowSessionViewModel! {
        didSet {
            self.showSessionViewModel.fetchNotes(sessionId: sessionViewModel!.id)
                .observeOn(MainScheduler.instance)
                .subscribe(
                    onNext: { notes in
                        let notesViewModel = notes.compactMap { NoteViewModel(note: $0) }
                        self.updateNotes(notesViewModel: notesViewModel)
                }, onError: { error in
                    self.fail(errorMsg: error.localizedDescription)
                })
                .disposed(by: disposeBag)
        }
    }

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showSessionViewModel = ShowSessionViewModel(updateNotes: self.updateNotes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if sessionViewModel == nil {
            showToast(message: "null session model")
            return
        }

        self.title = sessionViewModel?.sessionName
    }
    
    func updateNotes(notesViewModel: [NoteViewModel]) {
        self.notesViewModel = notesViewModel
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.notesViewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView
            .dequeueReusableCell(withReuseIdentifier: NoteCell.REUSABLE_ID, for: indexPath) as! NoteCell
        let note = self.notesViewModel[indexPath.item]
        cell.labelTopic.text = note.topic
        cell.labelDescription.text = note.description
        cell.labelTopic.textColor = UIColor.black
        cell.labelDescription.textColor = UIColor.black
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowSessionViewController.SEGUE_ID {
            let addNoteVC = segue.destination as! AddNoteViewController
            
            addNoteVC.sessionViewModel = sessionViewModel
            
        }
    }
}

extension UIViewController {
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
