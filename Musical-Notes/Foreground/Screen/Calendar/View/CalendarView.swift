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
        calendar.appearance.todayColor = .yellow
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = .systemPink
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.eventDefaultColor = UIColor.green // 하단에 찍히는 점
        calendar.appearance.eventSelectionColor = UIColor.black
        calendar.scrollEnabled = true
        calendar.placeholderType = .none
        return calendar
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                NavigationLink {
                    AddMemoView(viewModel: AddMemoViewModel())
                } label: {
                    Text("Upload for test")
                }
                .frame(maxWidth: .infinity, alignment: .center)

                
                TopMonthView(viewModel: viewModel, fsCalendar: fsCalendar)
                    .frame(maxWidth: 360)
                FSCalendarView(viewModel: viewModel, fsCalendar: fsCalendar)
                    .frame(height: viewModel.isSelectedScope ? 100 : 400)
                    .frame(maxWidth: 360)
                
                HStack(alignment: .top) {
                    dateLabel
                        .frame(minWidth: 60, maxWidth: 60, alignment: .leading)
                    Spacer(minLength: 12)
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.memos) { memo in
                            NavigationLink {
                                LazyNavigationView(LessonDetailView(viewModel: LessonMemoDetailViewModel(musicMemo: memo)))
                            } label: {
                                LessonCardView(memo: memo)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if viewModel.isInitialOpen {
                print("==initial open==")
                viewModel.findSelectedDateMemo(selectedDate: fsCalendar.today)
            } else {
                viewModel.fetchMemo()
            }
        }
        .onDisappear {
            viewModel.isInitialOpen = false
        }
        .refreshable {
            viewModel.fetchMemo()
        }
    }
    
    private var dateLabel: some View {
        HStack(alignment: .top) {
            Text(
                viewModel.selectedDate?.formattedString(dateFormat: .monthDate)
                ?? viewModel.today.formattedString(dateFormat: .monthDate)
            )
            .customFont(font: .medium, fontSize: 17)
            
            Spacer(minLength: 0)
            Rectangle()
                .fill(.black)
                .frame(width: 0.6)
        }
    }
}

#Preview {
    ContentView()
}
