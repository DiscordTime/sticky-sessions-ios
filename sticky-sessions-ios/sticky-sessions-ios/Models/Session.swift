//
//  Session.swift
//  sticky-sessions-ios
//
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import Foundation

class Session {
    var id : String = ""
    var topics : [String]
    var createAt : String = ""
    
    init() {
        topics = [String]()
    }
}
