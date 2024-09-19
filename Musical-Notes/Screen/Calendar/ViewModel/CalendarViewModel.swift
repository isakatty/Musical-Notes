//
//  CalendarViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import Foundation

final class CalendarViewModel: ObservableObject {
    @Published var isSelectedScope: Bool = false
    
    var today = Date()
    
    init() {
        print("== CalendarViewModel init ==")
    }
}
