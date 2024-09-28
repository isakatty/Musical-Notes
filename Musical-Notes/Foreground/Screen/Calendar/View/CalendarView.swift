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
        calendar.appearance.selectionColor = .systemPink
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.eventDefaultColor = UIColor.green // 하단에 찍히는 점
        calendar.appearance.eventSelectionColor = UIColor.black
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
                        .overlay {
                            FSCalendarView(viewModel: viewModel, fsCalendar: fsCalendar)
                                .frame(height: viewModel.isSelectedScope ? 100 : 350)
                                .frame(maxWidth: .infinity)
                        }
                        .frame(height: viewModel.isSelectedScope ? 100 : 350)
                        .frame(maxWidth: .infinity)
                        .shadow(radius: 5)
                    
                    Text("Records")
                        .customFont(font: .extraBold, fontSize: 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .top) {
                        dateLabel
                            .frame(minWidth: 60, maxWidth: 60, alignment: .leading)
                        Spacer(minLength: 12)
                        
                        if viewModel.memos.isEmpty {
                            NavigationLink {
                                LazyNavigationView(AddMemoView(viewModel: AddMemoViewModel()))
                            } label: {
                                EncourageMemoView()
                            }
                        } else {
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
                    }
                    
                    if !viewModel.memos.isEmpty {
                        NavigationLink {
                            LazyNavigationView(AddMemoView(viewModel: AddMemoViewModel()))
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.2))
                                .overlay {
                                    Text(" + 추가하기")
                                        .customFont()
                                        .foregroundStyle(.gray.opacity(0.55))
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(height: 30)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            if viewModel.isInitialOpen {
                print("initial Open!!")
                viewModel.findSelectedDateMemo(selectedDate: fsCalendar.today)
            } else {
                print("Not initial Open!!")
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
