//
//  SignUpController.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class SignUpController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Sign Up"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBacktoLogin(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
