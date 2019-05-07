//
//  AddNoteViewModel.swift
//  StickySessions
//
//  Created by Antonio Silva Júnior on 07/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class AddNoteViewModel {
    let repository:Repository = AlamofireRepository()
    
    func addNote(noteViewModel: NoteViewModel) {
        repository.add(urlStr: <#T##String#>, note: <#T##Note#>, onResponse: <#T##OnResponse#>) //note ou noteviewmodel?
    }
}
