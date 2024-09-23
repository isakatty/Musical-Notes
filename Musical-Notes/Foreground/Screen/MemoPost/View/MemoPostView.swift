//
//  MemoPostView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct MemoPostView: View {
    @State private var lessonDate = Date()
    @State private var isMusicSearchOn = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 날짜")
                        .customFont()
                    
                    DatePicker(selection: $lessonDate, displayedComponents: [.date]) {
                        EmptyView()
                    }
                }
                
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 시작 시간")
                        .customFont(font: .medium)
                    
                    DatePicker(selection: $lessonDate, displayedComponents: [.hourAndMinute]) {
                        EmptyView()
                    }
                    .datePickerStyle(.compact)
                }
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 마무리 시간")
                        .customFont(font: .medium)
                    
                    DatePicker(selection: $lessonDate, displayedComponents: [.hourAndMinute]) {
                        EmptyView()
                    }
                }
                
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("메모")
                        .customFont(font: .medium)
                }
                .padding(.top, 10)
                
                ZStack {
                    Text("어쩌구 저쩌구 헬로헬로 \n \n \n test texting \n TextEditor 들어올 자리")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all, 10)
                        .customFont()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.6)
                        .opacity(0.4)
                }
                
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("연습곡 추가")
                        .customFont(font: .medium)
                }
                .padding(.top, 10)
                
                Button(action: {
                    isMusicSearchOn = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.35))
                            .frame(height: 44)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                                .foregroundStyle(.black.opacity(0.4))
                                .frame(alignment: .leading)
                                .padding(.leading)
                            
                            Text("오늘 연습한 곡을 찾아보세요 :) ")
                                .foregroundStyle(.black.opacity(0.4))
                            Spacer()
                        }
                    }
                })
            }
        }
        .sheet(isPresented: $isMusicSearchOn, onDismiss: {
            isMusicSearchOn = false
        }, content: {
            MusicSearchView()
        })
        .padding(.horizontal)
        .navigationTitle("일지 작성")
    }
}

#Preview {
    NavigationStack {
        MemoPostView()
    }
}
