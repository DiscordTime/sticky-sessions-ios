//
//  Router.swift
//  sticky-sessions-ios
//
//  Created by Vinicius Albuquerque on 11/25/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//



protocol RouterProtocol {
    func route(from: String, action: String) -> Route?
}
