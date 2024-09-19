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
    
    @Binding var fsCalendar: FSCalendar
    
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
            print(date, "clicked date at calendar")
            print("여기서 데이터 찾아서 넘기나?")
            
            calendar.today = nil
        }
        
        func calendar(
            _ calendar: FSCalendar,
            numberOfEventsFor date: Date
        ) -> Int {
            if date.formattedString(dateFormat: .yearMonthDay) == Date().formattedString(dateFormat: .yearMonthDay) {
                return 1
            } else {
                return 0
            }
        }
    }
}
