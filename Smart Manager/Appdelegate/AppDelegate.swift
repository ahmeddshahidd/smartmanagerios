//
//  AppDelegate.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
//import Fabric
import RealmSwift
//import Crashlytics
//import CocoaLumberjack
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Fabric.sharedSDK().debug = true
//        Fabric.with([Crashlytics.self()])
//        DDLog.add(DDTTYLogger.sharedInstance) // TTY = Xcode console
//        DDLog.add(DDASLLogger.sharedInstance) // ASL = Apple System Logs
        IQKeyboardManager.sharedManager().enable = true
        
        return true
    }

    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func changeRootViewController(withHome: Bool)
    {
        
        if withHome { //AppStateManager.sharedInstance.isUserLoggedIn() == false {
            
            //if you are calling your navigation controller then you can use this syntex
            
            let mainTabBarController = AppStoryboard.Main.instance
                .instantiateViewController(withIdentifier: "MainTabBarController")
            
            self.window?.rootViewController = nil;
            
            //let sideMenuController:SideMenuController = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
            
            
           // let slideMenuController = SlideMenuController(mainViewController: mainTabBarController, leftMenuViewController: UIViewController(), rightMenuViewController: sideMenuController)
            
//            UIView.transition(with: self.window!, duration: 1.0, options: .transitionFlipFromLeft, animations: {
//                            }, completion: nil)

            self.window?.rootViewController = mainTabBarController
            self.window?.makeKeyAndVisible()

            
        }
        else
        {
            let signInController = SignInController.instantiate(fromAppStoryboard: .LoginModule)
            let navController = AppStoryboard.LoginModule.instance.instantiateViewController(withIdentifier: "SignInController_NavID")
            self.window?.rootViewController = nil;
            self.window?.rootViewController = navController
        }
    }
    
    
}

