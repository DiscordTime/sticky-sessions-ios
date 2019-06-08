//
//  ShowSessionViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/3/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class ShowSessionViewModel: OnResponse {
 
    let updateNotes: ([NoteViewModel]) -> Void
    let remoteAPI:RemoteAPI
    let notesRepository:NotesRepositoryProtocol
    var notesViewModel:[NoteViewModel] = []
    
    // TODO: Replace instantiation with Dependency Injection
    init(updateNotes: @escaping (([NoteViewModel]) -> Void)) {
        self.updateNotes = updateNotes
        self.remoteAPI = AlamofireRemoteAPI()
        self.notesRepository = NotesRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }
    
    func fetchNotes(sessionId: String, userName: String?) {
        notesRepository.getNotes(sessionId: sessionId, userName: userName!, onResponse: self)
    }
    
    func success(response: Any) {
        var notes: [Note]
        do {
            notes = try JSONDecoder().decode([Note].self, from: response as! Data)
        } catch _ {
            fail(errorMsg: "Error decoding JSON")
            return
        }

        notesViewModel = notes.compactMap {NoteViewModel(note: $0)}
        self.updateNotes(notesViewModel)
        
    }

    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
}
