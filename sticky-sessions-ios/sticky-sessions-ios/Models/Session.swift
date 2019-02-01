//
//  Session.swift
//  sticky-sessions-ios
//
//  Created by Temp on 04/12/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

class Session {
    
    let id: String
    let topics: [String]
    let date: String
    
    init(id: String, topics: [String], date: String) {
        self.id = id
        self.topics = topics
        self.date = date
    }
    
}
