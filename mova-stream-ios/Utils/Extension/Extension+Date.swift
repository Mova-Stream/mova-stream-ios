//
//  Extension+Date.swift
//  Mova
//
//  Created by HauNguyen on 24/12/2565 BE.
//

import Foundation

extension DateFormatter {
    static func defaultFormat() -> DateFormatter {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.calendar = Calendar(identifier: .iso8601)
        dateFormatterGet.locale = Locale.current
        dateFormatterGet.timeZone = TimeZone.current
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatterGet
    }
}

extension Date {
    
    func now(format: String? = "dd/mm/yyyy") -> String {
        let dateFormatter = DateFormatter.defaultFormat()
        
        if let format = format {
            dateFormatter.dateFormat = format
        }
                
        return dateFormatter.string(from: self)
    }
    
}
