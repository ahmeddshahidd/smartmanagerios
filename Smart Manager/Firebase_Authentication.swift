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
    
    func SignInUser(with email: String, password: String, success:@escaping DefaultBoolResultAPISuccesClosure,
                    failure:@escaping DefaultAPIFailureClosure )
    {
        Auth.auth().signIn(withEmail: email, password: password, completion: {
            (user, error) in
            
            if error == nil
            {
                print("Sign In Done!")
                success(true)
            }
            else
            {
                failure(error! as NSError)
            }
            
        })
    }
    
}
