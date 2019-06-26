//
//  AddNoteViewModel.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

class AddNoteViewModel {

    let remoteAPI:RemoteAPI
    let notesRepository: NotesRepositoryProtocol

    // TODO: Replace instantiation with Dependency Injection
    init() {
        self.remoteAPI = AlamofireRemoteAPI()
        self.notesRepository = NotesRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }
    
    func addNote(sessionId: String, desc: String, topic: String) -> Observable<Note> {
        let note = Note(sessionId: sessionId, userName: nil, topic: topic, description: desc)

        return notesRepository.addNote(note: note)
    }

}
