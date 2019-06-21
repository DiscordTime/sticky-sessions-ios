//
//  NotesReposiroty.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 07/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

class NotesRemoteRepository : NotesRepositoryProtocol {

    var remoteAPI: RemoteAPI
    var endpoint = Urls.BASE + "/notes"

    init(remoteAPI: RemoteAPI) {
        self.remoteAPI = remoteAPI
    }

    func getNotes(sessionId: String) -> Observable<[Note]> {
        let parameters = [
            "session_id": sessionId
        ]

        return remoteAPI.get(urlStr: endpoint, parameters: parameters,
                                  encodingType: EncodingType.queryString)
    }

    func addNote(note: Note) -> Observable<Note> {
        let parameters = [
            "topic": note.topic,
            "session_id": note.sessionId,
            "description": note.description
        ]

        return remoteAPI.post(urlStr: endpoint, parameters: parameters,
                                   encodingType: EncodingType.httpBody)
    }

}
