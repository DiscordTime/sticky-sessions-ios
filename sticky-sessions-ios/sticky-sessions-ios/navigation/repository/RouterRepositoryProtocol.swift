//
//  RouterRepositoryProtocol.swift
//  sticky-sessions-ios
//
//  Created by Temp on 28/11/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

protocol RouterRepositoryProtocol {
    func findRoute(from: String, action: String) -> Route?
}
