//
//  Firebase_Authentication.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 12/8/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation
import Firebase

class  Firebase_Authentication: NSObject {
    
    static let sharedInstance = Firebase_Authentication()
    
    override init() {
        
        super.init()
    }
    
    func SignInUser(with email: String, password: String, success:@escaping DefaultDictionaryResultAPISuccesClosure,
                    failure:@escaping DefaultAPIFailureClosure )
    {
        Auth.auth().signIn(withEmail: email, password: password, completion: {
            (user, error) in
            
            if error == nil
            {
                print("Sign In Done!")
                let refr = FirebaseConstantas.ref.child("users").child((user?.uid)!)
                print(refr)
                refr.observe(.value, with: {
                    snapshot in
                    if snapshot.exists()
                    {
                        var userInfoModel = snapshot.value as! [String : Any]
                        userInfoModel["user_id"] = user?.uid
                        success(userInfoModel)
                    }
                    
                    
                })
            }
            else
            {
                failure(error! as NSError)
            }
            
        })
    }
    
}
