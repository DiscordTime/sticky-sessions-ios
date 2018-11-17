//
//  ViewController.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 10/22/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    private var sessionsViewModels:[SessionTypeViewModel] = {
        let gainNPain = SessionType(name: "Gain N Pain", description: "", imageName: "niccage", type: SType.GAIN_N_PAIN)
        let starfish = SessionType(name: "Starfish", description: "", imageName: "niccage", type: SType.STARFISH)
        let custom = SessionType(name: "Custom Session", description: "Do one of your own", imageName: "niccage", type: SType.CUSTOM)
        
        let gainNPainViewModel = SessionTypeViewModel(sessionType: gainNPain)
        let starfishViewModel = SessionTypeViewModel(sessionType: starfish)
        let customViewModel = SessionTypeViewModel(sessionType: custom)
        return [gainNPainViewModel, starfishViewModel, customViewModel]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessionsViewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellCollectionView")
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SessionTypeCell.CELL_ID, for: indexPath) as! SessionTypeCell
        cell.sessionTypeViewModel = sessionsViewModels[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSessionViewModel = sessionsViewModels[indexPath.item]
        print(selectedSessionViewModel.name)
        
        let viewStarter = ViewStarter()
        //TODO: Remember to find how to inject the router
        viewStarter.show(route: Router().route(from: RouterRepository.HOME_CONTROLLER, action: RouterRepository.CHOOSE_SESSION_TYPE), navigation: self.navigationController)
    }

}

