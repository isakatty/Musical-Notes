//
//  LessonDetailView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/20/24.
//

import SwiftUI

struct LessonDetailView: View {
    @StateObject var viewModel: LessonMemoDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.musicMemo.regDate.formattedString(dateFormat: .yearMonthDayDate))
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.7))
                
                Text("오늘 \(viewModel.musicMemo.lessonType.toTitle) 곡")
                    .font(.system(size: 17, weight: .bold))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(viewModel.musicMemo.music) { music in
                            LessonMusicView(
                                imgStr: music.artwork,
                                width: 100,
                                height: 100,
                                artist: music.artist,
                                songTitle: music.songTitle,
                                duration: music.duration
                            )
                            .padding(.trailing)
                        }
                    }
                }
                
                Divider()
                    .background(Color.black.opacity(0.5))
                    .padding(.vertical, 10)
                
                Text("오늘 \(viewModel.musicMemo.lessonType.toTitle) 메모")
                    .font(.system(size: 17, weight: .bold))
                LessonMemoView(memo: viewModel.musicMemo.memoText)
                
                Text("오늘 \(viewModel.musicMemo.lessonType.toTitle) 시간")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.top, 40)
                
                LessonTimeCircleView(
                    total: 60,
                    progress: viewModel.musicMemo.endTime.changedToMinutes(startDate: viewModel.musicMemo.startTime),
                    totalTime: viewModel.musicMemo.endTime.changedToTime(startDate: viewModel.musicMemo.startTime)
                )
                .frame(maxWidth: .infinity, alignment: .center)
                
                LessonTimeView(
                    startTime: viewModel.musicMemo.startTime.formattedString(dateFormat: .hourMinutes),
                    endTime: viewModel.musicMemo.endTime.formattedString(dateFormat: .hourMinutes),
                    lessonType: viewModel.musicMemo.lessonType
                )
                .padding(.vertical)
                .padding(.top, 20)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowAlert = true
                    }, label: {
                        Text("삭제")
                    })
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .showAlert(isPresented: $isShowAlert, alertTitle: "게시글 삭제", alertSubTitle: "정말 삭제하시겠습니까?") {
            viewModel.removeMemo()
            dismiss()
        }
    }
}

