//
//  AddNoteViewModel.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class AddNoteViewModel: OnResponse {
    
    var note: Note
    
    func success(response: Any) {
        print("ae")
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
    init(sessionId: String, userName: String, desc: String, topic: String) {
        note = Note(sessionId: sessionId,
        userName: userName, topic: topic, description: desc)
    }
    
    let repository:Repository = AlamofireRepository()
    
    func addNote() {
        let noteParams = self.note
        let url = Urls.NOTES
        repository.add(urlStr: url, note: noteParams, onResponse: self) //note ou noteviewmodel?
    }
}
