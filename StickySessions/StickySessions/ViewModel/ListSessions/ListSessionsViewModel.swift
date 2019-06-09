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

    private let disposeBag = DisposeBag()

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
        sessionsRepository.getSessions()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { sessions in
                    let orderedSessions = sessions.sorted(
                        by: { $0.timestamp._seconds > $1.timestamp._seconds }
                    )

                    self.sessionsViewModel = orderedSessions.compactMap {
                        SessionViewModel(session: $0)
                    }

                    self.updateSessions(self.sessionsViewModel)
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
