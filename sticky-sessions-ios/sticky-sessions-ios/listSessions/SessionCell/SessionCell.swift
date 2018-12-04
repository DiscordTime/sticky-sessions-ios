//
//  SessionCell.swift
//  sticky-sessions-ios
//
//  Created by Temp on 04/12/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class SessionCell: UICollectionViewCell {
    public static let CELL_ID = "sessionCellId"
    
    @IBOutlet weak var labelSessionName: UILabel!
    @IBOutlet weak var labelSessionDate: UILabel!
    
    var sessionViewModel: SessionViewModel? {
        didSet {
            setupViews()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        labelSessionName.text = sessionViewModel?.name
        labelSessionDate.text = sessionViewModel?.date
    }
}
