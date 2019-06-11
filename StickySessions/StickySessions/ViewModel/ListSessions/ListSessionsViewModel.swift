//
//  ListSessionsViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

class ListSessionsViewModel {

    let remoteAPI:RemoteAPI
    let sessionsRepository:SessionsRepositoryProtocol

    // TODO: Replace instantiation with Dependency Injection
    init() {
        self.remoteAPI = AlamofireRemoteAPI()
        self.sessionsRepository = SessionsRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }

    func fetchSessions() -> Observable<[Session]> {
        return sessionsRepository.getSessions()
            .map({ sessions -> [Session] in
                return sessions.sorted(
                    by: { $0.timestamp._seconds > $1.timestamp._seconds }
                )
            })
    }

}
