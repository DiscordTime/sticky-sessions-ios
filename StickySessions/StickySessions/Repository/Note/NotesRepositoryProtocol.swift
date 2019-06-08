//
//  NotesRepositoryProtocol.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 07/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

protocol NotesRepositoryProtocol {
    func getNotes(sessionId: String, userName: String?, onResponse: OnResponse)
    func addNote(note: Note, onResponse: OnResponse)
}
