//
//  ListSessionsViewController.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 11/25/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class ListSessionsViewController: UICollectionViewController {
    
    private var sessionsViewModels:[SessionViewModel] = {
        let session1 = Session(id: "1", topics: ["1", "2", "3", "4"], date: "27/10/2018")
        let session2 = Session(id: "2", topics: ["1", "2", "3", "4", "5"], date: "31/10/2018")
        let session3 = Session(id: "3", topics: ["1", "2", "3", "4"], date: "02/11/2018")
        let session4 = Session(id: "4", topics: ["1", "2", "3", "4", "5"], date: "10/12/2018")
        
        let session1ViewModel = SessionViewModel(session: session1)
        let session2ViewModel = SessionViewModel(session: session2)
        let session3ViewModel = SessionViewModel(session: session3)
        let session4ViewModel = SessionViewModel(session: session4)
        return [session1ViewModel, session2ViewModel, session3ViewModel, session4ViewModel]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessionsViewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SessionCell.CELL_ID, for: indexPath) as! SessionCell
        cell.sessionViewModel = sessionsViewModels[indexPath.item]
        return cell
    }
}
