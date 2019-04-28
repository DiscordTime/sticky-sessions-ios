//
//  ListSessionsCell.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class ListSessionsCell: UICollectionViewCell {
    @IBOutlet weak var labelSessionName: UILabel!
    @IBOutlet weak var labelSessionDate: UILabel!
    
    static let REUSABLE_ID = "listSessionsCellId"
    
}
