//
//  Session.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

struct Session: Codable {
    
    var id: String
    var topics: [String]
    var timestamp: Timestamp
    
}

struct Timestamp: Codable {
    let _seconds:Double
    let _nanoseconds:Double
}
