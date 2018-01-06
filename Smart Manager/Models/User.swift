//
//  User.swift
//  AlbaCars
//
//  Created by Asad Rehman on 09/12/2016.
//  Copyright © 2016 Ingic. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    
//    dynamic var token
    
    dynamic var email = ""
    dynamic var name = ""
    dynamic var phone = ""
    dynamic var type = ""
    dynamic var user_id = ""
    
    override static func primaryKey() -> String? {
        return "user_id"
    }
    
    
}
