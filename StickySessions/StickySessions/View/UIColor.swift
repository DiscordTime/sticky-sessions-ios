//
//  UIColor.swift
//  StickySessions
//
//  Created by Jose Carlos de Moura Jr on 20/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct StickySessions
    {
        static let coral = UIColor(netHex: 0xff534b)
        
        
        static let defaultCardColor = UIColor(netHex: 0xff534b)
        static let starfishCardColor = UIColor(netHex: 0x933da9)
        static let gainPaindCardColor = UIColor(netHex: 0xf5c84e)
    }
}
