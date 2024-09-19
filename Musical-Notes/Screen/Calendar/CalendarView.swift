//
//  CalendarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var isSelectedWeekdays = false
    
    var body: some View {
        VStack {
            topMonthView
            FSCalendarView(isSelectedWeekdays: $isSelectedWeekdays)
                .frame(height: 400)
        }
    }
    
    private var topMonthView: some View {
        HStack {
            Text("2024년 9월")
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
                isSelectedWeekdays.toggle()
            }, label: {
                Text(isSelectedWeekdays ? "주" : "월")
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
