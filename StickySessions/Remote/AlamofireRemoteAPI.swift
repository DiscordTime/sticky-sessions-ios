//
//  AlamofireRemoteAPI.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 08/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift

class AlamofireRemoteAPI: RemoteAPI {

    func get<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                         encodingType: EncodingType?) -> Observable<T> {
        return request(urlStr: urlStr, method: HTTPMethod.get, parameters: parameters,
                       encodingType: encodingType)
    }

    func post<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                          encodingType: EncodingType?) -> Observable<T> {
        return request(urlStr: urlStr, method: HTTPMethod.post, parameters: parameters,
                       encodingType: encodingType)
    }

    func put<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                         encodingType: EncodingType?) -> Observable<T> {
        return request(urlStr: urlStr, method: HTTPMethod.put, parameters: parameters,
                       encodingType: encodingType)
    }

    func delete<T: Codable>(urlStr: String, parameters: Dictionary<String, Any>?,
                            encodingType: EncodingType?) -> Observable<T> {
        return request(urlStr: urlStr, method: HTTPMethod.delete, parameters: parameters,
                       encodingType: encodingType)
    }

    private func request<T: Codable>(urlStr: String, method: HTTPMethod,
                                     parameters: Dictionary<String, Any>?,
                                     encodingType: EncodingType?) -> Observable<T> {
        return Observable<T>.create { observer -> Disposable in

            let enconding = self.convertEncodingTypeToURLEncoding(encodingType: encodingType ??
                EncodingType.httpBody)
            
            FirebaseTokenProvider.getToken(onTokenResponse: { (tokenId, error) in
                if let err = error {
                    observer.onError(err)
                    return
                }
                
                Alamofire.request(urlStr, method: method, parameters: parameters, encoding: enconding, headers: ["Token":tokenId])
                    .responseJSON(completionHandler: {(response) in
                        switch response.result {
                        case .success:
                            guard let data = response.data else {
                                observer.onError(response.error ?? ApiError.unknown)
                                return
                            }
                            do {
                                let model = try JSONDecoder().decode(T.self, from: data)
                                observer.onNext(model)
                            } catch {
                                observer.onError(error)
                            }
                        case .failure(let error):
                            observer.onError(error)
                        }
                        
                    })
            })

            

            return Disposables.create()
        }
    }

    private func convertEncodingTypeToURLEncoding(encodingType: EncodingType) -> URLEncoding {
        switch encodingType {
        case .queryString:
            return URLEncoding.queryString
        case .httpBody:
            return URLEncoding.httpBody
        }
    }

}
