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
    
    init(viewModel: LessonMemoDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                Text(viewModel.musicMemo.regDate.formattedString(dateFormat: .yearMonthDayDate))
                    .customFont(font: .medium, fontSize: 16)
                    .foregroundStyle(Color(uiColor: UIColor.darkGray).opacity(0.7))
                
                // MARK: view2 - 시간
                LessonTimeView(
                    startTime: viewModel.musicMemo.startTime.formattedString(dateFormat: .hourMinutes),
                    endTime: viewModel.musicMemo.endTime.formattedString(dateFormat: .hourMinutes)
                )
                    .padding(.vertical)
                
                LessonTimeCircleView(
                    total: 60,
                    progress: viewModel.musicMemo.endTime.changedToMinutes(startDate: viewModel.musicMemo.startTime),
                    totalTime: viewModel.musicMemo.endTime.changedToTime(startDate: viewModel.musicMemo.startTime)
                )
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("오늘 \(viewModel.musicMemo.lessonType.toTitle) 메모")
                    .customFont(font: .bold, fontSize: 17)
                LessonMemoView(memo: viewModel.musicMemo.memoText)
                
                Text("오늘 \(viewModel.musicMemo.lessonType.toTitle) 곡")
                    .customFont(font: .bold, fontSize: 17)
                ForEach(viewModel.musicMemo.music) { music in
                    LessonMusicView(
                        imgStr: music.artwork,
                        width: 80,
                        height: 80,
                        artist: music.artist,
                        songTitle: music.songTitle,
                        duration: music.duration
                    )
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
//                    LazyNavigationView(<#T##closure: View##View#>)
                    Menu("더보기") {
                        Button(action: {
                            print("하이루")
                        }, label: {
                            Text("수정")
                        })
                        
                        Button(action: {
                            // MARK: alert 띄우기
                            print("하이루")
                            viewModel.removeMemo()
                            dismiss()
                        }, label: {
                            Text("삭제")
                        })
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

