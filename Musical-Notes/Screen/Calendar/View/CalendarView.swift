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
            topMonthView
            FSCalendarView(
                viewModel: viewModel,
                fsCalendar: $fsCalendar
            )
                .frame(height: 400)
        }
    }
}

extension CalendarView {
    private var topMonthView: some View {
        HStack {
            Text(fsCalendar.currentPage.formattedString(dateFormat: .yearMonth))
                .font(.title3)
                .bold()
            Spacer()
            Button(action: {
                if let prevMonth = viewModel.prevCurrentPage() {
                    print(prevMonth)
                    fsCalendar.setCurrentPage(prevMonth, animated: true)
                }
            }, label: {
                Image(systemName: "chevron.left")
            })
            
            Button(action: {
                if let nextMonth = viewModel.nextCurrentPage() {
                    print(nextMonth)
                    fsCalendar.setCurrentPage(nextMonth, animated: true)
                }
            }, label: {
                Image(systemName: "chevron.forward")
            })
            
            Button(action: {
                viewModel.isSelectedScope.toggle()
            }, label: {
                Text(viewModel.isSelectedScope ? "주" : "월")
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .frame(height: 30)
                    .clipShape(Capsule())
                    
            })
        }
        .padding(.horizontal)
    }
}
#Preview {
    ContentView()
}
