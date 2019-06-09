//
//  SessionsRemoteRepository.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 08/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

class SessionsRemoteRepository : SessionsRepositoryProtocol {

    var remoteAPI: RemoteAPI
    var endpoint = Urls.BASE + "/sessions"

    init(remoteAPI: RemoteAPI) {
        self.remoteAPI = remoteAPI
    }

    func getSessions() -> Observable<[Session]>  {
        return remoteAPI.get(urlStr: endpoint)
    }

}
