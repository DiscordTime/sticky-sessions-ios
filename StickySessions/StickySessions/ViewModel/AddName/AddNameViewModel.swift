//
//  AddNameViewModel.swift
//  StickySessions
//
//  Created by Patrick Steiger on 03/05/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

struct AddNameViewModel {
    
    init() {}
    
    func saveUserName(userName: String) {
        UserDefaults.standard.set(userName, forKey: "userName")
        print("Name saved: " + userName)
    }
    
    func readUserName() {
        // read from UserDefaults
    }
}
