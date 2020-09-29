//
//  CollectionViewCell.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 6/22/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class ListSessionCollectionViewCell: UICollectionViewCell {
    
    static let REUSABLE_ID = "listSessionCollectionCellXib"
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelResponses: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.frame = self.bounds
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let leftConstraint = contentView.leftAnchor.constraint(equalTo: leftAnchor)
        let rightConstraint = contentView.rightAnchor.constraint(equalTo: rightAnchor)
        let topConstraint = contentView.topAnchor.constraint(equalTo: topAnchor)
        let bottomConstraint = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
    }
    
    func setSession(session: SessionViewModel) {
        self.labelName.attributedText = NSAttributedString(string: session.sessionName, attributes: TextStyle.title.attributes)
        
        self.labelDescription.attributedText = NSAttributedString(string: session.description, attributes: TextStyle.description.attributes)
        self.labelDescription.numberOfLines = 2
        
        self.labelResponses.attributedText = NSAttributedString(string: "6 responses", attributes: TextStyle.responses.attributes)
        
        drawBorder(cardColor: session.color)
    }
    
    func drawBorder(cardColor:String)
    {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0,y: 0))
        path.addLine(to: CGPoint(x: 0,y: self.bounds.height))
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 10
        layer.strokeColor = UIColor(hexStr: cardColor).cgColor
        self.layer.addSublayer(layer)
    }
    
}
