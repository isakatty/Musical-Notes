//
//  CalendarViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import Foundation

final class CalendarViewModel: ObservableObject {
    @Published var isInitialOpen: Bool = false
    @Published var isSelectedScope: Bool = false
    @Published var currentPage: Date?
    @Published var selectedDate: Date?
    @Published var memos = [MNotesMemo]()
    
    var today = Date()
    
    init() {
        isInitialOpen = true
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
    
    func findSelectedDateMemo(selectedDate: Date?) {
        guard let selectedDate else {
            return
        }
        
        memos = Array(RealmRepository.shared.filterMemoWithDate(selected: selectedDate))
    }
    
    func fetchMemo() {
        if selectedDate == nil {
            findSelectedDateMemo(selectedDate: today)
        } else {
            findSelectedDateMemo(selectedDate: selectedDate)
        }
    }
}
