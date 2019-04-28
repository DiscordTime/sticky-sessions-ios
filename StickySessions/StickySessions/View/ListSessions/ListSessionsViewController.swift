//
//  ListSessionsViewController.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class ListSessionsViewController : UICollectionViewController, ListSessionsView {
    
    var sessions:[SessionViewModel] = []
    var listSessionsViewModel: ListSessionsViewModel! {
        didSet {
            listSessionsViewModel.fetchSessions()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listSessionsViewModel = ListSessionsViewModel(view: self)
        
    }
    
    func updateSessions(sessionsViewModel: [SessionViewModel]) {
        print("test0")
        self.sessions = sessionsViewModel
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("test1")
        let cell = self.collectionView
            .dequeueReusableCell(withReuseIdentifier: ListSessionsCell.REUSABLE_ID, for: indexPath) as! ListSessionsCell
        let session = self.sessions[indexPath.item]
        cell.labelSessionName.text = session.id
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(self.sessions.count)
        return self.sessions.count
    }
    
    
    
}
