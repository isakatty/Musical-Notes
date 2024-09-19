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
    
    private var currentPage: Date?
    
    init() {
        print("== CalendarViewModel init ==")
    }
    
    func nextCurrentPage() -> Date? {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = 1
        
        currentPage = cal.date(byAdding: dateComponents, to: currentPage ?? today)
        return currentPage
    }
    func prevCurrentPage() -> Date? {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = -1
        
        currentPage = cal.date(byAdding: dateComponents, to: currentPage ?? today)
        return currentPage
    }
}
