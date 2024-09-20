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
        ScrollView {
            VStack {
                TopMonthView(viewModel: viewModel, fsCalendar: $fsCalendar)
                FSCalendarView(viewModel: viewModel, fsCalendar: $fsCalendar)
                    .frame(height: viewModel.isSelectedScope ? 100 : 400)
                
                HStack(alignment: .top) {
                    dateLabel
                    Spacer()
                    VStack(alignment: .leading) {
                        LessonCardView()
                        LessonCardView()
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var dateLabel: some View {
        HStack(alignment: .top) {
            Text(
                viewModel.selectedDate?.formattedString(dateFormat: .monthDate)
                ?? viewModel.today.formattedString(dateFormat: .monthDate)
            )
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top)
            
            Rectangle()
                .frame(width: 2)
        }
    }
}
#Preview {
    ContentView()
}
