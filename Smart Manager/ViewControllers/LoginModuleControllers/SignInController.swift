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
        
//        let successClosure: DefaultArrayResultAPISuccessClosure = {
//            (result) in
//           
//            AppStateManager.sharedInstance.loggedInUser = User(value: result["Result"] as! NSDictionary)
//            
//          //  DDLogInfo(AppStateManager.sharedInstance.loggedInUser._token)
//            
//            try! Global.APP_REALM?.write(){
//                Global.APP_REALM?.add(AppStateManager.sharedInstance.loggedInUser, update: true)
//            }
//            
//            if (AppStateManager.sharedInstance.loggedInUser.user_id) > 0{
//                
//          //      DDLogInfo("User Logged In with Token \(AppStateManager.sharedInstance.loggedInUser?._token) ")
//                
//            
//                Constants.APP_DELEGATE.changeRootViewController()
//            }
//            
//        }
//    
//        APIManager.sharedInstance.authenticateUserWith(email: "asad@one.com", password: "asadrehman", success: successClosure) { (error) in
//            print (error)
//        }
// 
//    
//    Constants.APP_DELEGATE.changeRootViewController()

    /*
    let homeNavigation = AppStoryboard.Home.instance
        .instantiateViewController(withIdentifier: "HomeControllerNavigation")
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController = nil;
    
    
    UIView.transition(with: appDelegate.window!, duration: 1.0, options: .transitionFlipFromLeft, animations: {
        appDelegate.window?.rootViewController = homeNavigation
    }, completion: nil)
    */
    
    let homeComtroller = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "HomeController")
    self.navigationController?.pushViewController(homeComtroller, animated: true)
    
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
