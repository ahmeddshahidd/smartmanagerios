//
//  UIFont+Extension.swift
//  Smart Manager
//
//  Created by Ahmed Shahid on 1/3/18.
//  Copyright © 2018 Muzamil Hassan. All rights reserved.
//

import Foundation

extension UIFont {
    func sizeOfString(text: NSString, constrainedToWidth width: Double) -> CGSize {
        return text.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                 options: .usesLineFragmentOrigin,
                                 attributes: [NSFontAttributeName: self],
                                 context: nil).size
    }
}
