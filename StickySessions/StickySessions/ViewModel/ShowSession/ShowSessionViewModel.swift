//
//  ShowSessionViewModel.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 5/3/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class ShowSessionViewModel: OnResponse {
 
    let updateNotes: ([NoteViewModel]) -> Void
    let repository:Repository = AlamofireRepository()
    var notesViewModel:[NoteViewModel] = []
    
    init(updateNotes: @escaping (([NoteViewModel]) -> Void)) {
        self.updateNotes = updateNotes
    }
    
    func fetchNotes(sessionId: String, userName: String?) {
        var url = Urls.NOTES + "/" + sessionId
        if let uName = userName {
            url = url + "/" + uName
        }
        repository.fetch(urlStr: url, onResponse: self)
    }
    
    func success(response: Any) {
        var notes: [Note]
        do {
            notes = try JSONDecoder().decode([Note].self, from: response as! Data)
        } catch _ {
            fail(errorMsg: "Error decoding JSON")
            return
        }
        
        notesViewModel = notes.compactMap {NoteViewModel(note: $0)}
        self.updateNotes(notesViewModel)
        
    }
    
    func fail(errorMsg: String) {
        print(errorMsg)
    }
    
    
}
