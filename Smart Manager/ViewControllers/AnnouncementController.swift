//
//  AnnouncementController.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 11/1/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase
class AnnouncementController: BaseController {

    @IBOutlet weak var announcementTableView: UITableView!
    
    @IBOutlet weak var notificationTextField: UITextField!
    @IBOutlet weak var addNotiView: UIView!
    let notificationCells = UINib(nibName: "NotificationNewCell", bundle: nil)
    
    let ref_notifications = FirebaseConstantas.ref.child("notification")
    
    var notificationArray: [Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.announcementTableView.register(notificationCells, forCellReuseIdentifier: "NotificationNewCell")
        
        announcementTableView.estimatedRowHeight = 99
        announcementTableView.rowHeight = UITableViewAutomaticDimension
        
        self.getNotifications()
        // Do any additional setup after loading the view.
    }

    @IBAction func addNotiBtnPress(_ sender: Any) {
        self.addNotiView.isHidden = !self.addNotiView.isHidden
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addBtnPress(_ sender: Any) {
        if(!(self.notificationTextField.text?.isEmpty)!)
        {
            Utility.showLoader()
            Firebase_Project.sharedInstance.addNotification(with: self.notificationTextField.text!, success: {(success) in
                
                self.addNotiView.isHidden = true
                self.getNotifications()
                Utility.hideLoader()
            }, failure: {(failure) in
                Utility.hideLoader()
            })
        }
    }
    
    func getNotifications()
    {
        let project_id = Singleton.sharedInstance.currentProject.id
        Utility.showLoader()
        self.ref_notifications.queryOrdered(byChild: project_id).observe(.value, with: { snapshot in
            var newItems: [Notification] = []
            
            for item in snapshot.children {
                let notification = Notification(snapshot: item as! DataSnapshot)
                newItems.append(notification)
            }
            
            self.notificationArray = newItems
            self.announcementTableView.reloadData()
            Utility.hideLoader()
        })
    }
}

extension AnnouncementController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationNewCell", for: indexPath) as! NotificationNewCell
        
//        cell.BindData()
        cell.notiMainDescription.text = self.notificationArray[indexPath.row].notificationMessage
        
        return cell
    }
}
