//
//  Int+.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/26/24.
//

import Foundation

extension Int {
    var hour: Int {
        self / 3600
    }
    var minute: Int {
        (self % 3600) / 60
    }
    var seconds: Int {
        (self % 60)
    }
    var timeFormat: String {
        let hours = String(format: "%02d", self.hour)
        let minutes = String(format: "%02d", self.minute)
        let seconds = String(format: "%02d", self.seconds)
        
        return String("\(hours):\(minutes):\(seconds)")
    }
}
