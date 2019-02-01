//
//  SessionViewModel.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 11/15/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class SessionTypeViewModel {
    public let name: String
    public let description: String
    public let imageName: String
    
    public init(sessionType: SessionType) {
        self.name = sessionType.name
        self.description = sessionType.desc
        self.imageName = sessionType.imageName
    }
}
