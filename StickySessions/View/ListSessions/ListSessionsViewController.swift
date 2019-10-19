//
//  ListSessionsViewController.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit
import RxSwift

class ListSessionsViewController : UICollectionViewController {

    private let disposeBag = DisposeBag()

    static let SEGUE_ID:String = "listSessionsShowNextSegueId"
    
    var sessions:[SessionViewModel] = []
    var listSessionsViewModel: ListSessionsViewModel! {
        didSet {
            listSessionsViewModel.fetchSessions()
                .observeOn(MainScheduler.instance)
                .subscribe(
                    onNext: { sessions in
                        let sessionsViewModel = sessions.compactMap {
                            SessionViewModel(session: $0)
                        }
                        self.updateSessions(sessionsViewModel: sessionsViewModel)
                },
                    onError: { error in
                        self.fail(errorMsg: error.localizedDescription)
                })
                .disposed(by: disposeBag)
        }
    }
    
    var vcIndexPath: IndexPath? = nil

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Retrospective"
        
        self.collectionView.register(UINib.init(nibName: "ListSessionCellXib", bundle: nil), forCellWithReuseIdentifier: ListSessionCollectionViewCell.REUSABLE_ID)
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 155)
        }
        
        listSessionsViewModel = ListSessionsViewModel()
    }

    func updateSessions(sessionsViewModel: [SessionViewModel]) {
        self.sessions = sessionsViewModel
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView
            .dequeueReusableCell(withReuseIdentifier: ListSessionCollectionViewCell.REUSABLE_ID, for: indexPath) as! ListSessionCollectionViewCell
        let session = self.sessions[indexPath.item]
        cell.setSession(session: session)
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
       
        let showSessionVC = segue.destination as! ShowSessionViewController
        if let indexPath = self.vcIndexPath {
            showSessionVC.sessionViewModel = sessions[indexPath.item]
        }
    }
}
