//
//  AddMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

var musics: [MNotesMusic] = [
    MNotesMusic(id: "1539200376", songTitle: "넌 나 어때", artist: "406 Project", artwork: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/bd/1e/ee/bd1eee78-3d16-12ac-38bf-2289d9d76bb3/8806184740815.jpg/150x150bb.jpg"),
    MNotesMusic(id: "1746260068", songTitle: "Apartment", artist: "406 Project", artwork: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/bd/1e/ee/bd1eee78-3d16-12ac-38bf-2289d9d76bb3/8806184740815.jpg/150x150bb.jpg"),
    
]

struct AddMemoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: AddMemoViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 날짜")
                        .customFont()
                    
                    DatePicker(selection: $viewModel.memoDate, displayedComponents: [.date]) {
                        EmptyView()
                    }
                }
                
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 시작 시간")
                        .customFont(font: .medium)
                    
                    DatePicker(selection: $viewModel.startTime, displayedComponents: [.hourAndMinute]) {
                        EmptyView()
                    }
                    .datePickerStyle(.compact)
                }
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    
                    Text("레슨 마무리 시간")
                        .customFont(font: .medium)
                    
                    DatePicker(selection: $viewModel.endTime, displayedComponents: [.hourAndMinute]) {
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
                    TextEditor(text: $viewModel.memoText)
                        .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
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
                
                NavigationLink {
                    LazyNavigationView(MusicSearchView())
                } label: {
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
                }

            }
        }
        .padding(.horizontal)
        .navigationTitle("일지 작성")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {
                        print("저장 btn action")
                        if viewModel.validateInfo() {
                            viewModel.saveMemo(
                                memoDate: viewModel.memoDate,
                                start: viewModel.startTime,
                                end: viewModel.endTime,
                                memo: viewModel.memoText,
                                musics: musics
                            )
                            dismiss()
                        } else {
                            print("입력한 정보를 확인해달라는 alert 띄우기")
                        }
                    },
                    label: {
                        Text("저장")
                    }
                )
            }
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

#Preview {
    NavigationStack {
        AddMemoView(viewModel: AddMemoViewModel())
    }
}
