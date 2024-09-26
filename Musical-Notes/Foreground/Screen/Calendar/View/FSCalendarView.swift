//
//  FSCalendarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//


import SwiftUI

import FSCalendar

struct FSCalendarView: UIViewRepresentable {
    @ObservedObject var viewModel: CalendarViewModel
    var fsCalendar: FSCalendar
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        fsCalendar.delegate = context.coordinator
        fsCalendar.dataSource = context.coordinator
        return fsCalendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let calendar = uiView as! FSCalendar
        if viewModel.isSelectedScope {
            calendar.scope = .week
        } else {
            calendar.scope = .month
        }
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {
        var parent: FSCalendarView
        
        init(_ parent: FSCalendarView) {
            self.parent = parent
        }
        
        func calendar(
            _ calendar: FSCalendar,
            didSelect date: Date,
            at monthPosition: FSCalendarMonthPosition
        ) {
            parent.viewModel.selectedDate = date
            parent.viewModel.findSelectedDateMemo(selectedDate: date)
            calendar.today = nil
        }
        
        func calendar(
            _ calendar: FSCalendar,
            numberOfEventsFor date: Date
        ) -> Int {
            if parent.viewModel.fetchAllMemo().contains(where: { memo in
                memo.regDate.formattedString(dateFormat: .yearMonthDay) == date.formattedString(dateFormat: .yearMonthDay)
            }) {
                return 1
            }
            return 0
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            parent.viewModel.currentPage = calendar.currentPage
            print(calendar.currentPage, #function)
        }
    }
}
