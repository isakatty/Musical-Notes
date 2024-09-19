//
//  CalendarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        VStack {
            topMonthView
            FSCalendarView(isSelectedWeekdays: $viewModel.isSelectedScope)
                .frame(height: 400)
        }
    }
    
    private var topMonthView: some View {
        HStack {
            Text(viewModel.today.formattedString(dateFormat: .yearMonth))
                .font(.title3)
                .bold()
            Spacer()
            Button(action: {
                print("Action left btn")
            }, label: {
                Image(systemName: "chevron.left")
            })
            
            Button(action: {
                print("Action right btn")
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
