//
//  Note.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/4/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

struct Note: Codable {
    let id: String
    let sessionId: String
    let userName: String
    let topic: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sessionId = "session_id"
        case userName = "user"
        case topic
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.sessionId = try values.decode(String.self, forKey: .sessionId)
        self.userName = try values.decode(String.self, forKey: .userName)
        self.topic = try values.decode(String.self, forKey: .topic)
        self.description = try values.decode(String.self, forKey: .description)
    }
 
}
