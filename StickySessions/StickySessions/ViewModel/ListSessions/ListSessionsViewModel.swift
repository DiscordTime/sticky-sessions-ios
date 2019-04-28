//
//  ListSessionsViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class ListSessionsViewModel: OnResponse {
    
    let view: ListSessionsView
    let repository:Repository = AlamofireRepository()
    var sessionsViewModel:[SessionViewModel] = []
    
    init(view: ListSessionsView) {
        self.view = view
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
        
        sessionsViewModel = sessions.compactMap {SessionViewModel(session: $0)}
        self.view.updateSessions(sessionsViewModel: sessionsViewModel)
        
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
}
