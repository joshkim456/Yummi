//
//  DateMaker.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

import Foundation

class DateMaker {
    static func makeDate(from dateString: String) -> Date? {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
        
        return dateFormatter.date(from: dateString)
    }
}
