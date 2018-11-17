//
//  SessionType.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 11/15/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class SessionType: NSObject {
    
    public let name: String
    public let desc: String
    public let imageName: String
    public let type: SType
    
    public init(name: String, description: String, imageName: String, type: SType) {
        self.name = name
        self.desc = description
        self.imageName = imageName
        self.type = type
    }
}

enum SType {
    case STARFISH, GAIN_N_PAIN, CUSTOM
}
