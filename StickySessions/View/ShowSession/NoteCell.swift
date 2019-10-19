//
//  NoteCell.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/4/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class NoteCell: UICollectionViewCell {
   static let REUSABLE_ID = "noteCellId"
    
    @IBOutlet weak var labelTopic: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
}
