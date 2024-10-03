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
    private var fsCalendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.today = Date()
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.headerHeight = 0
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = .ivoryBlue
        calendar.appearance.weekdayTextColor = .gray
        calendar.appearance.eventDefaultColor = .ivoryBlue
        calendar.scrollEnabled = true
        calendar.placeholderType = .none
        return calendar
    }()
    
    var body: some View {
        VStack {
            Text("Calendar")
                .customFont(font: .extraBold, fontSize: 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView {
                VStack(alignment: .center) {
                    TopMonthView(viewModel: viewModel, fsCalendar: fsCalendar)
                        .frame(maxWidth: .infinity)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(color: .ivoryBlue.opacity(0.4), radius: 2)
                        .overlay {
                            FSCalendarView(viewModel: viewModel, fsCalendar: fsCalendar)
                                .frame(height: viewModel.isSelectedScope ? 100 : 350)
                                .frame(maxWidth: .infinity)
                        }
                        .frame(height: viewModel.isSelectedScope ? 100 : 350)
                        .frame(maxWidth: .infinity)
                    
                    CalendarRecordsView(viewModel: viewModel, fsCalendar: fsCalendar)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            if viewModel.isInitialOpen {
                viewModel.fetchMemo()
            } else {
                viewModel.fetchMemo()
                fsCalendar.reloadData()
            }
        }
        .onDisappear {
            viewModel.isInitialOpen = false
            viewModel.memos = []
        }
        .refreshable {
            viewModel.fetchMemo()
        }
    }
}
