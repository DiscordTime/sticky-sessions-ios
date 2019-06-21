//
//  ShowSessionViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/3/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

class ShowSessionViewModel {

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
    
    func fetchNotes(sessionId: String) -> Observable<[Note]> {
        return notesRepository.getNotes(sessionId: sessionId)
    }

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }

}
