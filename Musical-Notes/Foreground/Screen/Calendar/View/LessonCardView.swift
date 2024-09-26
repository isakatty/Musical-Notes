//
//  LessonCardView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct LessonCardView: View {
    let memo: MNotesMemo
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AsyncImgView(imgStr: memo.music.first?.artwork ?? "", width: 70, height: 70)
                
                VStack(alignment: .leading) {
                    Text(memo.lessonType.toTitle)
                        .customFont(font: .thin, fontSize: 13)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("\(memo.music.first?.artist ?? "") | Black, no Sugar")
                        .customFont(font: .regular, fontSize: 14)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("\(memo.music.first?.songTitle ?? "")")
                        .customFont(font: .medium, fontSize: 17)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Rectangle()
                .fill(.black.opacity(0.7))
                .frame(height: 0.8)
            MusicInfoDetailView(
                category: "\(memo.lessonType.toTitle)시간",
                memoDetail: memo.endTime.changedToTime(startDate: memo.startTime)
            )
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 0.6)
        )
    }
}
