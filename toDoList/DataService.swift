//
//  DataService.swift
//  toDoList
//
//  Created by Goodworkapps on 08.12.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import KeychainSwift

let data = Database.database().reference()

class DataService {
    private var _keyChain = KeychainSwift()
    private var refDatabase = data
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        } set {
            _keyChain = newValue
        }
    }
}
