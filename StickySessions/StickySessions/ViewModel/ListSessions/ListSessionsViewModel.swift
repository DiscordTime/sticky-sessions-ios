//
//  ListSessionsViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class ListSessionsViewModel: OnResponse {
    
    let remoteAPI:RemoteAPI
    let sessionsRepository:SessionsRepositoryProtocol

    let updateSessions: ([SessionViewModel]) -> Void
    var sessionsViewModel:[SessionViewModel] = []

    // TODO: Replace instantiation with Dependency Injection
    init(updateSessions: @escaping (([SessionViewModel]) -> Void)) {
        self.updateSessions = updateSessions
        self.remoteAPI = AlamofireRemoteAPI()
        self.sessionsRepository = SessionsRemoteRepository(remoteAPI: AlamofireRemoteAPI())
    }
    
    func fetchSessions() {
        sessionsRepository.getSessions(onResponse: self)
    }
    
    func success(response: Any) {
        var sessions: [Session]
        do {
            sessions = try JSONDecoder().decode([Session].self, from: response as! Data)
        } catch _ {
            fail(errorMsg: "Error decoding JSON")
            return
        }
        
        let orderedSessions = sessions.sorted(by: { $0.timestamp._seconds > $1.timestamp._seconds })

        sessionsViewModel = orderedSessions.compactMap {SessionViewModel(session: $0)}
        self.updateSessions(sessionsViewModel)
        
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
}
