//
//  NotesTabView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct NotesTabView: View {
    @State var currentTab : TabModel = .calendar
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            NavigationStack {
                CalendarView()
            }
            .tag(TabModel.calendar)
            .tabItem {
                Image(systemName: "calendar")
                Text("달력")
            }
            
            NavigationStack {
                FeedView()
            }
            .tag(TabModel.feed)
            .tabItem {
                Image(systemName: "book.pages.fill")
                Text("피드")
            }
            
//            NavigationStack {
//                MyPageView()
//            }
//            .tag(TabModel.myPage)
//            .tabItem {
//                Image(systemName: "person")
//                Text("My")
//            }
        }
        .tint(.ivoryBlue)
    }
}

#Preview {
    NotesTabView()
}
