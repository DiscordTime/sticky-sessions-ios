//
//  FirebaseTokenProvider.swift
//  StickySessions
//
//  Created by Jose Carlos de Moura Jr on 18/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseTokenProvider {
    
    static func getToken(onTokenResponse:@escaping (_ idToken:String, _ error: Error?)->()) {
        
        let user = Auth.auth().currentUser;
        if user != nil {
            user?.getIDToken(completion: { (idToken, error) in
                onTokenResponse(idToken ?? "", error)
            })
        } else {
            onTokenResponse("", AuthFailed.userNotFound)
        }
        
    }
    
}
enum AuthFailed : Error {
    case userNotFound
}
