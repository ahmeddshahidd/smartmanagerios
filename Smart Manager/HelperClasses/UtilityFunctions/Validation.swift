//
//  Validation.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation
import UIKit
class Validation {
    
    static func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func validateStringLength(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return !trimmed.isEmpty
    }
    
}
