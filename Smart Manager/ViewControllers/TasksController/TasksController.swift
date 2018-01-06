//
//  TasksController.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 12/19/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class TasksController: BaseController {

    @IBOutlet weak var headerHolder: UIView!
    @IBOutlet weak var taskTableView: UITableView!
    
    var tableviewHeaderFlag: Bool = false
    
    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addNewTaskBtn(_ sender: Any) {
        if(!(self.taskTextField.text?.isEmpty)!)
        {
            Utility.showLoader()
            Firebase_Project.sharedInstance.addTask(with: self.taskTextField.text!, success: {(success) in
                Utility.hideLoader()
            }, failure: {(failure) in
                Utility.hideLoader()
                
            })
        }
    }
    
    @IBAction func openTaskViewBtn(_ sender: Any) {
        self.headerHolder.isHidden = !self.headerHolder.isHidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TasksController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        return cell
    }
}
