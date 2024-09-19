//
//  CalendarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

import FSCalendar

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewModel()
    @State private var fsCalendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.today = Date()
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.headerHeight = 0
        calendar.appearance.selectionColor = .systemPink
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.eventDefaultColor = UIColor.black
        calendar.appearance.eventSelectionColor = UIColor.black
        return calendar
    }()
    
    var body: some View {
        VStack {
            TopMonthView(viewModel: viewModel, fsCalendar: $fsCalendar)
            FSCalendarView(viewModel: viewModel, fsCalendar: $fsCalendar)
                .frame(height: 400)
        }
    }
}
#Preview {
    ContentView()
}
