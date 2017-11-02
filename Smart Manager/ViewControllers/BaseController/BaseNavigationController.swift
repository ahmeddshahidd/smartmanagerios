//
//  BaseNavigationController.swift
//  Versole
//
//  Created by Soomro Shahid on 2/20/16.
//  Copyright © 2016 Muzamil Hassan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = AppConstants.THEME_COLOR_SKY_BLUE
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        self.navigationItem.backBarButtonItem?.title = " "
    }
    override func viewWillAppear(_ animated: Bool)    {
        super.viewWillAppear(true)
    }
    func test() {

//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: "close:")
//        this.na
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
//        style:UIBarButtonItemStyleBordered
//        target:self
//        action:@selector(close:)];
        
    }
}
