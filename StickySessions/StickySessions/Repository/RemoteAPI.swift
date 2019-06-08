//
//  RemoteAPI.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

protocol RemoteAPI {

    func get(urlStr: String,parameters: Dictionary<String, Any>?,
             encodingType: EncodingType?, onResponse: OnResponse)

    func post(urlStr: String, parameters: Dictionary<String, Any>?,
              encodingType: EncodingType?, onResponse: OnResponse)

    func put(urlStr: String, parameters: Dictionary<String, Any>?,
             encodingType: EncodingType?, onResponse: OnResponse)

    func delete(urlStr: String, parameters: Dictionary<String, Any>?,
             encodingType: EncodingType?, onResponse: OnResponse)

}

extension RemoteAPI {

    func get(urlStr: String, parameters: Dictionary<String, Any>? = nil,
             encodingType: EncodingType? = nil, onResponse: OnResponse) {
        get(urlStr: urlStr, parameters: parameters,
            encodingType: encodingType,onResponse: onResponse)
    }

    func post(urlStr: String, parameters: Dictionary<String, Any>? = nil,
              encodingType: EncodingType? = nil, onResponse: OnResponse) {
        post(urlStr: urlStr, parameters: parameters,
             encodingType: encodingType,onResponse: onResponse)
    }

    func put(urlStr: String, parameters: Dictionary<String, Any>? = nil,
             encodingType: EncodingType? = nil, onResponse: OnResponse) {
        put(urlStr: urlStr, parameters: parameters,
         encodingType: encodingType,onResponse: onResponse)
    }

    func delete(urlStr: String, parameters: Dictionary<String, Any>? = nil,
                encodingType: EncodingType? = nil, onResponse: OnResponse) {
        delete(urlStr: urlStr, parameters: parameters,
               encodingType: encodingType,onResponse: onResponse)
    }

}

protocol OnResponse {
    func success(response: Any)
    func fail(errorMsg: String)
}

