//
//  UITextField+Extension.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 1/3/18.
//  Copyright © 2018 Muzamil Hassan. All rights reserved.
//

import Foundation

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
