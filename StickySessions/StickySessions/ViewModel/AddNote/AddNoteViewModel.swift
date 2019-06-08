//
//  AddNoteViewModel.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class AddNoteViewModel: OnResponse {

    let remoteAPI:RemoteAPI
    let notesRepository: NotesRepositoryProtocol

    // TODO: Replace instantiation with Dependency Injection
    init() {
        self.remoteAPI = AlamofireRemoteAPI()
        self.notesRepository = NotesRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }

    func success(response: Any) {
        print("note added")
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
    func addNote(sessionId: String, userName: String, desc: String, topic: String) {
        let note = Note(sessionId: sessionId,
        userName: userName, topic: topic, description: desc)
        notesRepository.addNote(note: note, onResponse: self)
    }

}
