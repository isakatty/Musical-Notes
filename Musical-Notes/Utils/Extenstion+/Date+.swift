//
//  Date+.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import Foundation

extension Date {
    func formattedString(dateFormat: DateFormat) -> String {
        return dateFormat.formatter.string(from: self)
    }
    
    func changedToTime(startDate: Date) -> String {
        let useTime = Int(self.timeIntervalSince(startDate))
        return useTime.timeFormat
    }
    
    func changedToMinutes(startDate: Date) -> Int {
        let useTime = Int(self.timeIntervalSince(startDate))
        return useTime / 60
    }
}
