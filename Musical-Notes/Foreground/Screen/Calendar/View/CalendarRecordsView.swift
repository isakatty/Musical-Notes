//
//  CalendarRecordsView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/30/24.
//

import SwiftUI

import FSCalendar

struct CalendarRecordsView: View {
    @ObservedObject var viewModel: CalendarViewModel
    var fsCalendar: FSCalendar
    
    var body: some View {
        Text("Records")
            .customFont(font: .extraBold, fontSize: 24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
        
        HStack(alignment: .top) {
            dateLabel
                .frame(minWidth: 60, maxWidth: 60, alignment: .leading)
            Spacer(minLength: 12)
            
            if viewModel.memos.isEmpty {
                NavigationLink {
                    LazyNavigationView(AddMemoView(viewModel: AddMemoViewModel(memoDate: fsCalendar.selectedDate ?? Date())))
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
                LazyNavigationView(AddMemoView(viewModel: AddMemoViewModel(memoDate: fsCalendar.selectedDate ?? Date())))
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ivoryBlue.opacity(0.2))
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
                .frame(width: 1)
        }
    }
}
