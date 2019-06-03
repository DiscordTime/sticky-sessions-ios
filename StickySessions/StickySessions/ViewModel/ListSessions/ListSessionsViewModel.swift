//
//  ListSessionsViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class ListSessionsViewModel: OnResponse {
    
    let updateSessions: ([SessionViewModel]) -> Void
    let repository:Repository = AlamofireRepository()
    var sessionsViewModel:[SessionViewModel] = []
    
    init(updateSessions: @escaping (([SessionViewModel]) -> Void)) {
        self.updateSessions = updateSessions
    }
    
    func fetchSessions() {
        repository.fetch(urlStr: Urls.SESSIONS, onResponse: self)
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
