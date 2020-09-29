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
    var description: String = ""
    var dateStr: String = ""
    var sessionName: String = ""
    var color: String = ""
    
    init(session: Session) {
        self.id = session.id
        self.topics = session.topics
        self.sessionName = session.title
        self.color = session.color ?? ""

        defineDate(timestamp: session.timestamp)
        self.description = dateStr + "\n"
        self.description += session.description ?? "Bi-weekly meeting to discuss pain points, celebrate achievements and define common actions to all."
    }
    
    mutating func defineDate(timestamp: Timestamp) {
        let date = Date(timeIntervalSince1970: timestamp._seconds)
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone.current
        self.dateStr = dateFormatter.string(from: date)
    }
}
