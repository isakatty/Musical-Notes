//
//  CalendarViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import Foundation

final class CalendarViewModel: ObservableObject {
    @Published var isSelectedScope: Bool = false
    @Published var currentPage: Date?
    @Published var selectedDate: Date?
    
    var today = Date()
    
    init() {
        print("== CalendarViewModel init ==")
    }
    
    func nextCurrentPage(isMonth: Bool) -> Date? {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        
        if isMonth {
            dateComponents.weekOfMonth = 1
        } else {
            dateComponents.month = 1
        }
        
        currentPage = cal.date(byAdding: dateComponents, to: currentPage ?? today)
        return currentPage
    }
    func prevCurrentPage(isMonth: Bool) -> Date? {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        
        if isMonth {
            dateComponents.weekOfMonth = -1
        } else {
            dateComponents.month = -1
        }
        
        currentPage = cal.date(byAdding: dateComponents, to: currentPage ?? today)
        return currentPage
    }
}
