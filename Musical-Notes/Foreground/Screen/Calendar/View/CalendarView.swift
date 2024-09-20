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
        calendar.appearance.todayColor = .yellow
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = .systemPink
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.eventDefaultColor = UIColor.green // 하단에 찍히는 점
        calendar.appearance.eventSelectionColor = UIColor.black
        calendar.scrollEnabled = false
        return calendar
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TopMonthView(viewModel: viewModel, fsCalendar: $fsCalendar)
                FSCalendarView(viewModel: viewModel, fsCalendar: $fsCalendar)
                    .frame(height: viewModel.isSelectedScope ? 100 : 400)
                
                HStack(alignment: .top) {
                    dateLabel
                        .frame(minWidth: 60, maxWidth: 60, alignment: .leading)
                    Spacer(minLength: 12)
                    // MARK: Realm
                    VStack(alignment: .leading) {
                        NavigationLink {
                            LazyNavigationView(LessonDetailView())
                        } label: {
                            LessonCardView()
                        }
                        .buttonStyle(.plain)
                        LessonCardView()
                    }
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var dateLabel: some View {
        HStack(alignment: .top) {
            Text(
                viewModel.selectedDate?.formattedString(dateFormat: .monthDate)
                ?? viewModel.today.formattedString(dateFormat: .monthDate)
            )
            .customFont(font: .semiBold, fontSize: 17)
            
            Spacer(minLength: 0)
            Rectangle()
                .frame(width: 1.5)
        }
    }
}
#Preview {
    ContentView()
}
