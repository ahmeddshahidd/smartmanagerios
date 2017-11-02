//
//  AnnouncementController.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 11/1/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class AnnouncementController: BaseController {

    @IBOutlet weak var announcementTableView: UITableView!
    
    let notificationCells = UINib(nibName: "NotificationNewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.announcementTableView.register(notificationCells, forCellReuseIdentifier: "NotificationNewCell")
        
        announcementTableView.estimatedRowHeight = 99
        announcementTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AnnouncementController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationNewCell", for: indexPath) as! NotificationNewCell
        
        cell.BindData()
        
        return cell
    }
}
