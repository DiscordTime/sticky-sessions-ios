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
    let description: String
    var dateStr: String = ""
    var sessionName: String = "Custom"
    
    init(session: Session) {
        self.id = session.id
        self.topics = session.topics
        self.description = session.description ?? "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor."
        defineDate(timestamp: session.timestamp)
        defineSessionName(count: session.topics.count)
    }
    
    mutating func defineSessionName(count:Int) {
        switch count {
        case 4:
            self.sessionName = "Gain & Pleasure"
            break
        case 5:
            self.sessionName = "Starfish"
            break
        default:
            self.sessionName = "Custom"
        }
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
