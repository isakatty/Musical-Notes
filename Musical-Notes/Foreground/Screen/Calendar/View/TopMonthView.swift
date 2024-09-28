//
//  TopMonthView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI
import FSCalendar

struct TopMonthView: View {
    @ObservedObject var viewModel: CalendarViewModel
    var fsCalendar: FSCalendar
    
    var body: some View {
        HStack {
            Text(viewModel.currentPage?.formattedString(dateFormat: .yearMonth) ?? viewModel.today.formattedString(dateFormat: .yearMonth))
                .customFont(font: .medium, fontSize: 20)
            Spacer()
            Image(systemName: "chevron.left")
                .wrapToButton {
                    if let prevMonth = viewModel.prevCurrentPage(isMonth: viewModel.isSelectedScope) {
                        fsCalendar.setCurrentPage(prevMonth, animated: true)
                    }
                }
                .buttonStyle(.plain)
            
            Image(systemName: "chevron.forward")
                .wrapToButton {
                    if let nextMonth = viewModel.nextCurrentPage(isMonth: viewModel.isSelectedScope) {
                        fsCalendar.setCurrentPage(nextMonth, animated: true)
                    }
                }
                .buttonStyle(.plain)
                .padding(.trailing, 10)
            
            Text(viewModel.isSelectedScope ? "주" : "월")
                .customFont()
                .padding()
                .background(Color.gray.opacity(0.3))
                .frame(height: 30)
                .clipShape(Capsule())
                .wrapToButton {
                    viewModel.isSelectedScope.toggle()
                }
                .buttonStyle(.plain)
        }
    }
}
