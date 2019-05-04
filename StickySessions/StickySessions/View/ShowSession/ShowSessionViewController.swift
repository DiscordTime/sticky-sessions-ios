//
//  ShowSessionViewController.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/3/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class ShowSessionViewController: UICollectionViewController {
    
    var sessionViewModel: SessionViewModel?
    var userName: String? = nil
    var notesViewModel: [NoteViewModel] = []
    var showSessionViewModel: ShowSessionViewModel! {
        didSet {
            self.showSessionViewModel.fetchNotes(sessionId: sessionViewModel!.id, userName: userName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if sessionViewModel == nil {
            showToast(message: "null session model")
            return
        }

        self.title = sessionViewModel?.sessionName

        self.userName = UserDefaults.standard.string(forKey: "userName")
        self.showSessionViewModel = ShowSessionViewModel(updateNotes: self.updateNotes)
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
        return cell
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
