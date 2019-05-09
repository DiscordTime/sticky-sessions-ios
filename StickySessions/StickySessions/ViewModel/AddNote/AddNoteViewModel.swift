//
//  AddNoteViewModel.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class AddNoteViewModel:OnResponse {
    func success(response: Any) {
        print("ae")
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
    
    var sessionId: String = ""
    var userName: String = ""
    var desc: String = ""
    var topic: String = ""
    
    init(sessionId: String, userName: String, desc: String, topic: String) {
        self.sessionId = sessionId
        self.userName = userName
        self.desc = desc
        self.topic = topic
    }
    
    let repository:Repository = AlamofireRepository()
    
    func addNote() {
        let params: [String] = [sessionId, userName, desc, topic]
        let url = Urls.NOTES
        repository.add(urlStr: url, params: params, onResponse: self) //note ou noteviewmodel?
    }
}
