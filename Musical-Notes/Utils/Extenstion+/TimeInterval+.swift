//
//  TimeInterval+.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation

extension TimeInterval {
    func strFormatted() -> String {
        let interval = Int(self)
        let minutes = Int(interval / 60)
        let seconds = interval % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
