//
//  SignUpController.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class SignUpController: BaseController {
    
    @IBOutlet weak var nameEAField: EATextField!
    @IBOutlet weak var emailEAField: EATextField!
    @IBOutlet weak var passwordEAField: EATextField!
    @IBOutlet weak var phoneEAField: EATextField!
    
    //    var ref = Firebase(url: "https://chatty93.firebaseio.com/")
    
    // let ref = FIRDatabase.database().reference(withPath: "grocery-items")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Sign Up"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpBtnPress(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailEAField.textfield.text!,
                               password: self.passwordEAField.textfield.text!) { user, error in
                                if error == nil {
                                    // 3
                                    //                                        Auth.auth().signIn(withEmail: self.emailEAField.textfield.text!,
                                    //                                                               password: self.passwordEAField.textfield.text!)
                                    Auth.auth().signIn(withEmail: self.emailEAField.textfield.text!, password: self.passwordEAField.textfield.text!, completion: {
                                        (userSignIn, errorSignIn) in
                                        
                                        if errorSignIn == nil {
                                            print("Sign Up and Sign In Done!")
                                            
                                            let userDict: [String : Any] = [
                                                "name": self.nameEAField.textfield.text!,
                                                "phone": self.phoneEAField.textfield.text!,
                                                "email": userSignIn?.email!,
                                                "type" : "1"
                                            ]
                                            // 1 for project manager 2 for resource
                                            
                                            FirebaseConstantas.ref.child("users").child((userSignIn?.uid)!).setValue(userDict)
                                            {
                                                errorUser, dbRef in
                                                if errorUser == nil
                                                {
                                                    AppStateManager.sharedInstance.createUser(with: userDict, user_id: (userSignIn?.uid)!)
                                                }
                                            }
                                            
                                        }
                                        
                                    })
                                    
                                }
        }
        
        
    }
    
    @IBAction func goBacktoLogin(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
