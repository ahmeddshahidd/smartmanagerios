//
//  GroupChatController.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 11/1/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class GroupChatController: BaseController {

    @IBOutlet weak var groupChatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        groupChatTableView.estimatedRowHeight = 55
        groupChatTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GroupChatController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row % 3 == 0) // I am sending
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessegesCell", for: indexPath) as! ReceiverMessegesCell
            
            cell.BindData()
            
            return cell
        }
        else // I am receiving
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderMessagesCell", for: indexPath) as! SenderMessagesCell
            
            cell.BindData()
            
            return cell
        }
        
    }
}
