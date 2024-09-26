//
//  DateFormat.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import Foundation

enum DateFormat: String {
    case yearMonth = "yyyy월 MM월"
    case yearMonthDay = "yyyy.MM.dd"
    case monthDate = "MM.dd"
    case hourMinutes = "a hh:mm:ss"
    case yearMonthDayDate = "yyyy년 MM월 dd일(E)"
}

extension DateFormat {
    private static var cachedFormatters: NSCache<NSString, DateFormatter> = .init()

    var formatter: DateFormatter {
        Self.cachedFormatter(ofDateFormat: rawValue)
    }

    static func cachedFormatter(ofDateFormat dateFormat: String) -> DateFormatter {
        let dateFormatKey = NSString(string: dateFormat)
        if let cachedFormatter = cachedFormatters.object(forKey: dateFormatKey) {
            return cachedFormatter
        }

        let formatter = makeFormatter(withDateFormat: dateFormat)
        cachedFormatters.setObject(formatter, forKey: dateFormatKey)
        return formatter
    }

    private static func makeFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
}
