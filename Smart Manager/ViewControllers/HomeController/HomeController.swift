//
//  HomeController.swift
//  MultipleStoryboard
//
//  Created by Faraz Haider on 04/01/2017.
//  Copyright © 2017 Ingic. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeController: BaseController {

    @IBOutlet weak var projectTitle: UITextField!
    @IBOutlet weak var addNewProjectView: UIView!
    
    @IBOutlet weak var projectsTableView: UITableView!
    
//    let ref = Database.database().reference(withPath: "projects")
    let ref = FirebaseConstantas.ref.child("projects")
      var projectsArray: [Project] = []
    let tableArray = ["Treatz Asia","Dining & Night life","Jaibi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.loadProjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.setNavigationBarItem()
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func addBtnPress(_ sender: Any)
    {
        if(!(self.projectTitle.text?.isEmpty)!)
        {
            Utility.showLoader()
            Firebase_Project.sharedInstance.createPorject(with: self.projectTitle.text!, success: {(success) in
                self.addNewProjectView.isHidden = true
                self.loadProjects()
               
                Utility.hideLoader()
            }, failure: {(failure) in
                Utility.hideLoader()
            })
        }
        
    }
    @IBAction func addProjectBtnPress(_ sender: Any) {
        self.addNewProjectView.isHidden = !self.addNewProjectView.isHidden
    }
    
    func loadProjects()
    {
        let user_id = AppStateManager.sharedInstance.loggedInUser.user_id
        Utility.showLoader()
        self.ref.queryOrdered(byChild: user_id).observe(.value, with: { snapshot in
            var newItems: [Project] = []
            
            for item in snapshot.children {
                let projectItem = Project(snapshot: item as! DataSnapshot)
                newItems.append(projectItem)
            }
            
            self.projectsArray = newItems
            self.projectsTableView.reloadData()
            Utility.hideLoader()
        })
    }
}

extension HomeController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projectsArray.count//self.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeProjectCell", for: indexPath) as! HomeProjectCell
        
        cell.projectTitles?.text = self.projectsArray[indexPath.row].projectTitle//self.tableArray[indexPath.row]
        
        return cell
    }
}

extension HomeController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Singleton.sharedInstance.currentProject = self.projectsArray[indexPath.row]
        Constants.APP_DELEGATE.changeRootViewControllerToProject()
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

