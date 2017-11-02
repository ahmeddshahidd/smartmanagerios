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

    dynamic var _token = ""
    dynamic var company_name = "";
    dynamic var email = ""
    dynamic var first_name = ""
    dynamic var full_name = ""
    dynamic var last_name = ""
    dynamic var mobile_no = ""
    dynamic var phone = ""
    dynamic var state = ""
    dynamic var user_id = 0
    
    
    override static func primaryKey() -> String? {
        return "user_id"
    }
    
    
}
