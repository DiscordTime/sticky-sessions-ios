//
//  AlamofireRemoteAPI.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 08/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

import Alamofire

class AlamofireRemoteAPI: RemoteAPI {

    func get(urlStr: String,
             parameters: Dictionary<String, Any>?,
             encodingType: EncodingType?,
             onResponse: OnResponse) {

        request(urlStr: urlStr, method: HTTPMethod.get, parameters: parameters, encodingType: encodingType, onResponse: onResponse)
    }

    func post(urlStr: String, parameters: Dictionary<String, Any>?,
              encodingType: EncodingType?, onResponse: OnResponse) {

        request(urlStr: urlStr, method: HTTPMethod.post, parameters: parameters, encodingType: encodingType, onResponse: onResponse)
    }

    func put(urlStr: String, parameters: Dictionary<String, Any>?,
             encodingType: EncodingType?, onResponse: OnResponse) {

        request(urlStr: urlStr, method: HTTPMethod.put, parameters: parameters, encodingType: encodingType, onResponse: onResponse)
    }

    func delete(urlStr: String, parameters: Dictionary<String, Any>?,
                encodingType: EncodingType?, onResponse: OnResponse) {

        request(urlStr: urlStr, method: HTTPMethod.delete, parameters: parameters, encodingType: encodingType, onResponse: onResponse)
    }

    private func request(urlStr: String, method: HTTPMethod, parameters: Dictionary<String, Any>?,
                         encodingType: EncodingType?, onResponse: OnResponse) {

        let enconding = convertEncodingTypeToURLEncoding(encodingType: encodingType ?? EncodingType.httpBody)

        Alamofire.request(urlStr,
                          method: method,
                          parameters: parameters,
                          encoding: enconding)
            .responseJSON(completionHandler: {(response) in
                guard response.result.isSuccess else {
                    print(response)
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

    func convertEncodingTypeToURLEncoding(encodingType: EncodingType) -> URLEncoding {
        switch encodingType {
        case EncodingType.queryString:
            return URLEncoding.queryString
        default:
            return URLEncoding.httpBody
        }
    }

}
