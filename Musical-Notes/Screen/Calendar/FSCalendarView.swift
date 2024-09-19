//
//  FSCalendarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//


import SwiftUI

import FSCalendar

struct FSCalendarView: UIViewRepresentable {
    @Binding var isSelectedWeekdays: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.appearance.selectionColor = .systemPink
        calendar.today = Date()
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.headerHeight = 0
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let calendar = uiView as! FSCalendar
        if isSelectedWeekdays {
            calendar.scope = .week
        } else {
            calendar.scope = .month
        }
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDelegateAppearance {
        var parent: FSCalendarView
        
        init(_ parent: FSCalendarView) {
            self.parent = parent
        }
        
        func calendar(
            _ calendar: FSCalendar,
            didSelect date: Date,
            at monthPosition: FSCalendarMonthPosition
        ) {
            
        }
    }
}
