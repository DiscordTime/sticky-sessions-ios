//
//  SessionTypeCell.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 11/16/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class SessionTypeCell : UICollectionViewCell {
    
    public static let CELL_ID = "sessiontypeCellId"
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageSessionType: UIImageView!
    
    var sessionTypeViewModel: SessionTypeViewModel? {
        didSet {
            setupViews()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        labelTitle.text = sessionTypeViewModel?.name
        imageSessionType.image = UIImage(named: sessionTypeViewModel?.imageName ?? "")
    }
    
}
