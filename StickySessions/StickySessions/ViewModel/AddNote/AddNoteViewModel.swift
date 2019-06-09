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

    private let disposeBag = DisposeBag()

    let remoteAPI:RemoteAPI
    let notesRepository: NotesRepositoryProtocol

    // TODO: Replace instantiation with Dependency Injection
    init() {
        self.remoteAPI = AlamofireRemoteAPI()
        self.notesRepository = NotesRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }
    
    func addNote(sessionId: String, userName: String, desc: String, topic: String) {
        let note = Note(sessionId: sessionId,
        userName: userName, topic: topic, description: desc)

        notesRepository.addNote(note: note)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { note in
                    self.success(note: note)
            },
                onError: { error in
                    self.fail(errorMsg: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }

    func success(note: Note) {
        print("Note Added: ", note)
    }

    func fail(errorMsg: String) {
        print("Error: ", errorMsg)
    }

}
