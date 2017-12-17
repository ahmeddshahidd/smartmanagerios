//
//  Notification.swift
//  Smart Manager
//
//  Created by Rameez Hasan on 12/17/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase
struct Notification {
    
    let id: String
    let notificationMessage: String
    let projectManager_id: String
    let project_id: String
    let ref: DatabaseReference?
    
    
    init(notificationMessage: String, id: String = "", projectManager_id: String, project_id: String) {
        self.id = id
        self.notificationMessage = notificationMessage
        self.projectManager_id = projectManager_id
        self.project_id = project_id
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        id = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.notificationMessage = snapshotValue["message"] as! String
        self.projectManager_id = snapshotValue["projectManager_id"] as! String
        self.project_id = snapshotValue["project_id"] as! String
        ref = snapshot.ref
    }
    
}
