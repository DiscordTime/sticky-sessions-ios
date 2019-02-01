//
//  Router.swift
//  sticky-sessions-ios
//
//  Created by Temp on 28/11/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

class Router: RouterProtocol {
    
    var routerRepository:RouterRepositoryProtocol
    
    init(routerRepository: RouterRepositoryProtocol) {
        self.routerRepository = routerRepository
    }
    
    init() {
        self.routerRepository = RouterRepository()
    }
    
    func route(from: String, action: String) -> Route? {
        return self.routerRepository.findRoute(from: from, action: action)
    }
}
