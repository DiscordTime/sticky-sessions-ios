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
    @IBOutlet weak var labelSessionDesc: UILabel!
    @IBOutlet weak var labelSessionResponses: UILabel!
    
    static let REUSABLE_ID = "listSessionsCellId"
    
    
    func drawBorder(type:String)
    {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 20,y: 0))
        path.addLine(to: CGPoint(x: 20,y: 150))
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 10
        var color =  UIColor.StickySessions.defaultCardColor.cgColor
        if(type == "Starfish") {
            color = UIColor.StickySessions.starfishCardColor.cgColor
        }
        if(type == "Gain & Pleasure") {
            color = UIColor.StickySessions.gainPaindCardColor.cgColor
        }
        layer.strokeColor = color
        self.layer.addSublayer(layer)
    }
    
    public func setSession(session:SessionViewModel)
    {
        self.labelSessionName.attributedText = NSAttributedString(string: session.sessionName, attributes: TextStyle.title.attributes)
        
        self.labelSessionDesc.attributedText = NSAttributedString(string: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.", attributes: TextStyle.description.attributes)
        self.labelSessionDesc.numberOfLines = 0
        
        self.labelSessionResponses.attributedText = NSAttributedString(string: "6 responses", attributes: TextStyle.responses.attributes)
        drawBorder(type: session.sessionName)
    }
    
}
