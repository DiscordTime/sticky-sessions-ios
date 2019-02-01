//
//  RequestProtocol.swift
//  sticky-sessions-ios
//
//  Created by Temp on 04/12/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//


protocol RequestProtocol {
    associatedtype T
    
    func get(url: String, params: Dictionary<String, Any>) -> T
    func post(url: String, params: Dictionary<String, Any>) -> T
}
