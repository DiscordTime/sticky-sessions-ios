//
//  RemoteAPI.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 4/27/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import RxSwift

protocol RemoteAPI {

    func get<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                         encodingType: EncodingType?) -> Observable<T>

    func post<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                          encodingType: EncodingType?) -> Observable<T>

    func put<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                         encodingType: EncodingType?) -> Observable<T>

    func delete<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                            encodingType: EncodingType?) -> Observable<T>

}

extension RemoteAPI {

    func get<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>? = nil,
                         encodingType: EncodingType? = nil) -> Observable<T> {
        return get(urlStr: urlStr, parameters: parameters, encodingType: encodingType)
    }

    func post<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>? = nil,
                          encodingType: EncodingType? = nil) -> Observable<T> {
        return post(urlStr: urlStr, parameters: parameters, encodingType: encodingType)
    }

    func put<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>? = nil,
                         encodingType: EncodingType? = nil) -> Observable<T> {
        return put(urlStr: urlStr, parameters: parameters, encodingType: encodingType)
    }

    func delete<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>? = nil,
                            encodingType: EncodingType? = nil) -> Observable<T> {
        return delete(urlStr: urlStr, parameters: parameters, encodingType: encodingType)
    }

}
