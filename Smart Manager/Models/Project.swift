//
//  Project.swift
//  Smart Manager
//
//  Created by Rameez Hasan on 12/17/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Project {
    
    let id: String
    let projectTitle: String
    let ref: DatabaseReference?
    
    init(projectTitle: String, id: String = "") {
        self.id = id
        self.projectTitle = projectTitle
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        id = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.projectTitle = snapshotValue["title"] as! String
        ref = snapshot.ref
    }
    
}
