//
//  Message.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 1/9/18.
//  Copyright © 2018 Muzamil Hassan. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Message {
    
    let id: String
    let project_id: String
    let sender_id: String
    let senderName: String
    let message: String
    let createDate: String
    let ref: DatabaseReference?
    
    
//    init(notificationMessage: String, id: String = "", projectManager_id: String, project_id: String) {
//        self.id = id
//        self.notificationMessage = notificationMessage
//        self.projectManager_id = projectManager_id
//        self.project_id = project_id
//        self.ref = nil
//    }
    
    init(snapshot: DataSnapshot) {
        id = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        self.project_id = snapshotValue["project_id"] as! String
        self.sender_id = snapshotValue["sender_id"] as! String
        self.senderName = snapshotValue["senderName"] as! String
        self.message = snapshotValue["message"] as! String
        self.createDate = snapshotValue["createDate"] as! String
        
        ref = snapshot.ref
    }
    
}
