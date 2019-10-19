//
//  SessionsRepositoryProtocol.swift
//  StickySessions
//
//  Created by Carlos Rodrigo Cordeiro Garcia on 08/06/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation
import RxSwift

protocol SessionsRepositoryProtocol {

    func getSessions() -> Observable<[Session]>

}
