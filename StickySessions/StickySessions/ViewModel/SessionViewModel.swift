//
//  SessionViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

struct SessionViewModel {
    
    let id:String
    let topics:[String]
    let timestamp: Date
    
    init(session: Session) {
        self.id = session.id
        self.topics = session.topics
        self.timestamp = Date(timeIntervalSince1970: session.timestamp._seconds)
    }
}
