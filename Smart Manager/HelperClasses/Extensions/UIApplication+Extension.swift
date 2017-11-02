//
//  UIApplication+Extension.swift
//  Template
//
//  Created by alijabbar on 3/20/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation

extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(NSURL(string: url)! as URL) {
                application.open(NSURL(string: url)! as URL, options: [:], completionHandler: nil)
                return
            }
        }
    }
}
