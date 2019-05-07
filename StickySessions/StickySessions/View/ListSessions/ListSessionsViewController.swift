//
//  ListSessionsViewController.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class ListSessionsViewController : UICollectionViewController {
    
    static let SEGUE_ID:String = "listSessionsShowNextSegueId"
    
    var sessions:[SessionViewModel] = []
    var listSessionsViewModel: ListSessionsViewModel! {
        didSet {
            listSessionsViewModel.fetchSessions()
        }
    }
    
    var vcIndexPath: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listSessionsViewModel = ListSessionsViewModel(updateSessions: self.updateSessions)
    }
    
    func updateSessions(sessionsViewModel: [SessionViewModel]) {
        self.sessions = sessionsViewModel
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView
            .dequeueReusableCell(withReuseIdentifier: ListSessionsCell.REUSABLE_ID, for: indexPath) as! ListSessionsCell
        let session = self.sessions[indexPath.item]
        cell.labelSessionName.text = session.sessionName
        cell.labelSessionDate.text = session.dateStr
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sessions.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.vcIndexPath = indexPath
        self.performSegue(withIdentifier: ListSessionsViewController.SEGUE_ID, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != ListSessionsViewController.SEGUE_ID {
            return
        }
       
     //   if  let navigationController = segue.destination as? UINavigationController {
       //    let showSessionVC = navigationController.topViewController as? ShowSessionViewController
        //  } else {
            let showSessionVC = segue.destination as! ShowSessionViewController
            if let indexPath = self.vcIndexPath {
                showSessionVC.sessionViewModel = sessions[indexPath.item]
            }
     //   }
        
    }
}
