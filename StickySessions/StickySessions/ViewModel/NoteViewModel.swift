//
//  NoteViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/4/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

struct NoteViewModel {
    let id: String
    let sessionId: String
    let userName: String
    let topic: String
    let description: String
    
    init(note: Note) {
        self.id = note.id
        self.sessionId = note.sessionId
        self.userName = note.userName
        self.topic = note.topic
        self.description = note.description
    }
}
