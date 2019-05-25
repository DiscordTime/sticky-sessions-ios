//
//  AlamofireRepository.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Alamofire

class AlamofireRepository: Repository {
    
    func add(urlStr: String, params: [String], onResponse: OnResponse) {
        guard let url = URL(string: urlStr) else {
            onResponse.fail(errorMsg: "Invalid url")
            return
        }
        
        Alamofire.request(url, method: .post, parameters: [
            "topic":params[3],
            "session_id": params[0],
            "user": params[1],
             "description": params[2]
            ], encoding: JSONEncoding.default)
        .responseJSON(completionHandler: {(response) in
            guard response.result.isSuccess else {
                onResponse.fail(errorMsg: "Error")
                return
            }
            
            onResponse.success(response: response.data!)
        })
    }
    
    func fetch(urlStr: String, onResponse: OnResponse) {
        guard let url = URL(string: urlStr) else {
            onResponse.fail(errorMsg: "Invalid url")
            return
        }
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { (response) in
                guard response.result.isSuccess else {
                    onResponse.fail(errorMsg: "Request failed")
                    return
                }
                
                guard response.result.value != nil else {
                    onResponse.fail(errorMsg: "result nil")
                    return
                }
                
                onResponse.success(response: response.data!)
        })
    }
}
