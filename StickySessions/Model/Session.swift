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
    var description: String?
    var timestamp: Timestamp
    var title: String
    var color: String?
    
}

struct Timestamp: Codable {
    let _seconds:Double
    let _nanoseconds:Double
}
