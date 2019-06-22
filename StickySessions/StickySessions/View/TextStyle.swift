//
//  TextStyle.swift
//  StickySessions
//
//  Created by Jose Carlos de Moura Jr on 21/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import UIKit

enum TextStyle {
    case title
    case description
    case responses
}

extension TextStyle {
    var attributes: [NSAttributedString.Key: Any] {
        switch self {
        case .title:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = 20
            paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingTail;
            return [.font: UIFont.init(name: "Roboto-Medium", size: 16) as Any,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.8705882352941177)]
            
        case .description:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = 20
            paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingTail
            return [.font: UIFont(name: "Roboto-Regular", size: 14) as Any,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkGray]
            
        case .responses:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = 20
            return [.font: UIFont(name: "Roboto-Regular", size: 14) as Any,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.StickySessions.coral]
        }
    }
}
