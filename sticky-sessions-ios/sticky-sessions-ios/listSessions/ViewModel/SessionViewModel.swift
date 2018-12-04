//
//  SessionViewModel.swift
//  sticky-sessions-ios
//
//  Created by Temp on 04/12/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

class SessionViewModel {
    
    public let id: String
    public let name: String
    public let topics: [String]
    public let date: String
    
    public init(session: Session) {
        self.id = session.id
        self.topics = session.topics
        self.date = session.date
        
        if (topics.count == 4) {
            self.name = "Gain N Pleasure"
        } else {
            self.name = "Starfish"
        }
    }
    
    
}
