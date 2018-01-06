//
//  ParserHelper.swift
//  Smart Manager
//
//  Created by Rameez Hasan on 12/17/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation

class ParserHelper {
    static func getCurrentDate(withThis format: String) -> String
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = format
        return dateFormatterGet.string(from: Date())
    }
}
