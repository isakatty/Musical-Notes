//
//  CustomTabView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var currentTab : TabModel = .calendar
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            tabView2.zIndex(0)
            tabView.zIndex(1)
        })
    }
}
extension CustomTabView {
    var tabView2 : some View {
            TabView (selection: $currentTab) {
                CalendarView()
                    .tag(TabModel.calendar)
                
                FeedView()
                    .tag(TabModel.feed)
                
                MyPageView()
                    .tag(TabModel.myPage)
            }
            .setTabBarVisibility(isHidden: true)
        }
    
    var tabView: some View {
        HStack{
            Button(action: {
                withAnimation {
                    currentTab = .calendar
                }
            }, label: {
                Capsule(style: .circular).fill(.yellow)
                    .overlay(Text("홈").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .calendar ? 1 : 0.8)
                    .opacity(currentTab == .calendar ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
            
            Button(action: {
                withAnimation {
                    currentTab = .feed
                }
            }, label: {
                Capsule(style: .circular).fill(.orange)
                    .overlay(
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                    )
                    .padding()
                    .scaleEffect(currentTab == .feed ? 1 : 0.8)
                    .opacity(currentTab == .feed ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
            
            Button(action: {
                withAnimation {
                    currentTab = .myPage
                }
            }, label: {
                Capsule(style: .circular).fill(.blue)
                    .overlay(Text("마이").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .myPage ? 1 : 0.8)
                    .opacity(currentTab == .myPage ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
        }
        .frame(height: 90)
        .background(
            Color.gray.opacity(0.9)
                .blur(radius: 2)
                .edgesIgnoringSafeArea(.bottom)
        )
        .clipShape(Capsule(style: .circular))
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView()
}
