//
//  BaseController.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setNavigationBarItem() {
        self.addRightBarButtonWithImage(UIImage(named: "menu_icon")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
//        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()

    }
    
    func removeNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    @IBAction func backBtnPress(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
