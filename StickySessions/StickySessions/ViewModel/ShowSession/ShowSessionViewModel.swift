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
 
    private let disposeBag = DisposeBag()

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
        notesRepository.getNotes(sessionId: sessionId, userName: userName!)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { notes in
                    self.notesViewModel = notes.compactMap {NoteViewModel(note: $0)}
                    self.updateNotes(self.notesViewModel)
            },
                onError: { error in
                    self.fail(errorMsg: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }

}
