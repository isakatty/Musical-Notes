//
//  AddMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: AddMemoViewModel
    
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.memoDate.formattedString(dateFormat: .yearMonthDayDate))
                    .customFont(font: .medium, fontSize: 17)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                CustomPickerView(preselectedIndex: $viewModel.selectedSeg, options: MNotes.allCases)
                    .frame(width: 200)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                DatePicker(selection: $viewModel.startTime, displayedComponents: [.hourAndMinute]) {
                    EmptyView()
                }
                .datePickerStyle(.compact)
                .makeCategoryView("시작 시간")
                
                DatePicker(selection: $viewModel.endTime, displayedComponents: [.hourAndMinute]) {
                    EmptyView()
                }
                .datePickerStyle(.compact)
                .makeCategoryView("마무리 시간")
                
                EmptyView()
                    .makeCategoryView("메모")
                    .padding(.top, 10)
                
                ZStack {
                    TextEditor(text: $viewModel.memoText)
                        .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
                        .customFont()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.6)
                        .opacity(0.4)
                }
                
                EmptyView()
                    .makeCategoryView("연습곡 추가")
                    .padding(.top, 10)
                
                NavigationLink {
                    LazyNavigationView(MusicSearchView(parentVM: viewModel))
                } label: {
                    makeSearchMusicBar()
                }
                
                ForEach(viewModel.selectedMusics) { item in
                    MusicSearchCompoView(
                        albumImg: item.artwork,
                        artistName: item.artist,
                        songTitle: item.songTitle,
                        duration: item.duration
                    )
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
                                musics: viewModel.selectedMusics
                            )
                            dismiss()
                        } else {
                            print("입력한 정보를 확인해달라는 alert 띄우기")
                            isShowAlert = true
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
        .showOneBtnAlert(isPresented: $isShowAlert, alertTitle: "일지를 작성하기에 부족한 정보가 있습니다.", alertSubTitle: "다시 확인해주세요.", btnText: "확인") {
            isShowAlert.toggle()
        }
    }
}

extension AddMemoView {
    func makeSearchMusicBar() -> some View {
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
