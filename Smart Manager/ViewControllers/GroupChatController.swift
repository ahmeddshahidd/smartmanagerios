//
//  GroupChatController.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 11/1/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GroupChatController: BaseController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var groupChatTableView: UITableView!
    
    let ref_message = FirebaseConstantas.ref.child("messages")
    
    var messagesArray = [Message]()
    
    let senderID: String = AppStateManager.sharedInstance.loggedInUser.user_id
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        groupChatTableView.estimatedRowHeight = 55
        groupChatTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getAllMessages()
        
        self.messageTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendBtnPress(_ sender: Any) {
        if(!(self.messageTextField.text?.isEmpty)!) {
            self.sendThisMessage(with: self.messageTextField.text!)
        }
    }
    
    func sendThisMessage(with text: String) {
        Utility.showLoader()
        Firebase_Project.sharedInstance.addMessageToGroup(with: text, success: { success in
            Utility.hideLoader()
            
            self.messageTextField.text = ""
            self.messageTextField.resignFirstResponder()
            
            self.getAllMessages()
        }, failure: { failure in
            Utility.hideLoader()
        })
    }
    
    func getAllMessages() {
        
        let project_id = Singleton.sharedInstance.currentProject.id
        self.ref_message.queryOrdered(byChild: "project_id").queryEqual(toValue: project_id).observe(.value, with: { snapshot in
            var newItems: [Message] = []
            
            self.messagesArray.removeAll()
            
            for item in snapshot.children {
                let message = Message(snapshot: item as! DataSnapshot)
                newItems.append(message)
            }
            
            self.messagesArray = newItems
            self.groupChatTableView.reloadData()
            
            self.scrollToLastCell()
            
            Utility.hideLoader()
        })
    }
    
    func scrollToLastCell()
    {
        if(self.messagesArray.count > 0)
        {
            let lastCellIndexPath = IndexPath(row: self.messagesArray.count - 1, section: 0)
            self.groupChatTableView.scrollToRow(at: lastCellIndexPath, at: .top, animated: false)
        }
    }
}

extension GroupChatController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.messagesArray[indexPath.row].sender_id == senderID) // I am sending
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverMessegesCell", for: indexPath) as! ReceiverMessegesCell
            
            cell.BindData(messageObj: self.messagesArray[indexPath.row])
            
            return cell
        }
        else // I am receiving
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderMessagesCell", for: indexPath) as! SenderMessagesCell
            
            cell.BindData(messageObj: self.messagesArray[indexPath.row])
            
            return cell
        }
        
    }
}


// MARK:- UITextField Delegate
extension GroupChatController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
