//
//  Repository.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

protocol Repository {
    func fetch(urlStr: String, onResponse: OnResponse)
    func add(urlStr: String, params: [String], onResponse: OnResponse)
}

protocol OnResponse {
    func success(response: Any)
    func fail(errorMsg: String)
}

