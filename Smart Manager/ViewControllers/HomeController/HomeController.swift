//
//  HomeController.swift
//  MultipleStoryboard
//
//  Created by Faraz Haider on 04/01/2017.
//  Copyright © 2017 Ingic. All rights reserved.
//

import UIKit

class HomeController: BaseController {

    let tableArray = ["Treatz Asia","Dining & Night life","Jaibi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.setNavigationBarItem()
    }
    
//    @IBAction func logoutFromApplication(_ sender: Any) {
//
//        
//        try!  Global.APP_REALM?.write(){
//            
//           // AppStateManager.sharedInstance.realm.delete(AppStateManager.sharedInstance.loggedInUser)
//            Global.APP_REALM?.delete(AppStateManager.sharedInstance.loggedInUser)
//            
//           // AppStateManager.sharedInstance.loggedInUser = nil
//        }
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.changeRootViewController()
//    }
//
//    @IBAction func goToSettings(_ sender: Any) {
//        
//        let settingController = SettingsController.instantiate(fromAppStoryboard: .Settings)
//        
//        self.navigationController?.pushViewController(settingController, animated: true)
//    }

}

extension HomeController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeProjectCell", for: indexPath) as! HomeProjectCell
        
        cell.projectTitles?.text = self.tableArray[indexPath.row]
        
        return cell
    }
}

extension HomeController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Constants.APP_DELEGATE.changeRootViewController(withHome: true)
    }
}





//extension HomeController : SlideMenuControllerDelegate {
//    
//    func leftWillOpen() {
//        print("SlideMenuControllerDelegate: leftWillOpen")
//    }
//    
//    func leftDidOpen() {
//        print("SlideMenuControllerDelegate: leftDidOpen")
//    }
//    
//    func leftWillClose() {
//        print("SlideMenuControllerDelegate: leftWillClose")
//    }
//    
//    func leftDidClose() {
//        print("SlideMenuControllerDelegate: leftDidClose")
//    }
//    
//    func rightWillOpen() {
//        print("SlideMenuControllerDelegate: rightWillOpen")
//    }
//    
//    func rightDidOpen() {
//        print("SlideMenuControllerDelegate: rightDidOpen")
//    }
//    
//    func rightWillClose() {
//        print("SlideMenuControllerDelegate: rightWillClose")
//    }
//    
//    func rightDidClose() {
//        print("SlideMenuControllerDelegate: rightDidClose")
//    }
//}

