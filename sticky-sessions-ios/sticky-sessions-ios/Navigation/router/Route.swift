//
//  Route.swift
//  sticky-sessions-ios
//
//  Created by Temp on 28/11/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

class Route {
    
    var storyboardName: String
    var viewControllerId: String
    
    init(storyboardName: String, viewControllerId: String) {
        self.storyboardName = storyboardName
        self.viewControllerId = viewControllerId
    }
    
    init() {
        self.storyboardName = "from"
        self.viewControllerId = "to"
    }
}
