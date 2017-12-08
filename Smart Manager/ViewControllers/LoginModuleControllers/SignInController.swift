//
//  SignInController.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
//import Crashlytics
import RealmSwift
//import CocoaLumberjack
class SignInController: BaseController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //for checking Crashlytic
        
        /* let button = UIButton(type: UIButtonType.roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: .normal)
        button.addTarget(self, action: #selector(crashButtonTapped(sender:)), for: .touchUpInside)
        view.addSubview(button)
*/
        // Do any additional setup after loading the view.
        
        //self.title = "Sign In"
       

    }
//    @IBAction func crashButtonTapped(sender: AnyObject) {
//        Crashlytics.sharedInstance().crash()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
   @IBAction func processSignInRequest(){
    
    Firebase_Authentication.sharedInstance.SignInUser(with: self.emailAddressTextField.text!, password: self.passwordTextField.text!, success: {
        (success) in
        
        if(success)
        {
            Constants.APP_DELEGATE.changeRootViewController()
        }
        
    }, failure: {
        (error) in
    })
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
