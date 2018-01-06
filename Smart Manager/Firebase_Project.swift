//
//  Firebase_Project.swift
//  Smart Manager
//
//  Created by Rameez Hasan on 12/17/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation
import Firebase

class Firebase_Project: NSObject {
    static let sharedInstance = Firebase_Project()
    
    override init() {
        
        super.init()
    }
    
    let ref_notifications = FirebaseConstantas.ref.child("notification")
    
    func createPorject(with title: String, success:@escaping DefaultBoolResultAPISuccesClosure,
                       failure:@escaping DefaultAPIFailureClosure)
    {
        let projectDic: [String : Any] = [
            "title": title,
            "creationDate": ParserHelper.getCurrentDate(withThis: "yyyy-MM-dd"),
            "projectManager_id": AppStateManager.sharedInstance.loggedInUser.user_id,
            ]
        
        FirebaseConstantas.ref.child("projects").childByAutoId().setValue(projectDic)
        { (error, dbref) in
            if error == nil
            {
                success(true)
            }
            else
            {
                failure(error! as NSError)
            }
        }
    }
    
    func addNotification(with notificationText: String, success:@escaping DefaultBoolResultAPISuccesClosure,
                         failure:@escaping DefaultAPIFailureClosure)
    {
        let notificationDic: [String : Any] = [
            "message": notificationText,
            "projectManager_id": AppStateManager.sharedInstance.loggedInUser.user_id,
            "project_id": Singleton.sharedInstance.currentProject.id,
            "createDate" : ParserHelper.getCurrentDate(withThis: "yyyy-MM-dd")
            ]
        
        FirebaseConstantas.ref.child("notification").childByAutoId().setValue(notificationDic)
        { (error, dbref) in
            if error == nil
            {
                success(true)
                
            }
            else
            {
                failure(error! as NSError)
            }
        }
    }
    
    func getNotifications(with project_id: String, success:@escaping DefaultArrayResultAPISuccessClosure,
                          failure:@escaping DefaultAPIFailureClosure)
    {
        let project_id = Singleton.sharedInstance.currentProject.id
        Utility.showLoader()
        self.ref_notifications.queryOrdered(byChild: project_id).observe(.value, with: { snapshot in
            var newItems: [Project] = []
            
            for item in snapshot.children {
                let projectItem = Project(snapshot: item as! DataSnapshot)
                newItems.append(projectItem)
            }
            Utility.hideLoader()
        })
    }
    
    
    func addTask(with taskTitle: String, success:@escaping DefaultBoolResultAPISuccesClosure,
                 failure:@escaping DefaultAPIFailureClosure)
    {
        let taskDic: [String : Any] = [
            "title": taskTitle,
            "projectManager_id": AppStateManager.sharedInstance.loggedInUser.user_id,
            "project_id": Singleton.sharedInstance.currentProject.id,
            "createDate" : ParserHelper.getCurrentDate(withThis: "yyyy-MM-dd"),
            "status" : "0" // 0 for in-progress, 1 for complete, 2 for hold
        ]
        
        FirebaseConstantas.ref.child("tasks").childByAutoId().setValue(taskDic)
        { (error, dbref) in
            if error == nil
            {
                success(true)
                
            }
            else
            {
                failure(error! as NSError)
            }
        }
    }
}
