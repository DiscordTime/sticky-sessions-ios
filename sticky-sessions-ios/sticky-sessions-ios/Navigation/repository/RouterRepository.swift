//
//  RouterRepository.swift
//  sticky-sessions-ios
//
//  Created by Temp on 28/11/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

class RouterRepository: RouterRepositoryProtocol {
    
    //FROMS
    static let HOME_CONTROLLER = "home-view-controller"
    
    //ACTIONS
    static let CHOOSE_SESSION_TYPE = "choose-session-type"
    
    
    let routesDictionary = [
        HOME_CONTROLLER+CHOOSE_SESSION_TYPE:
            Route(storyboardName: "ListSessions", viewControllerId: "listSessionsControllerId")
    ]
    
    func findRoute(from: String, action: String) -> Route? {
        return routesDictionary[from+action]
    }
}
