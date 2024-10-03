//
//  FeedRecordMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/29/24.
//

import SwiftUI

struct FeedRecordMemoView: View {
    var musicMemo: MNotesMemo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black)
                .frame(width: 120, height: 34)
                .overlay {
                    Text(musicMemo.regDate.formattedString(dateFormat: .yearMonthDay))
                        .customFont(font: .bold)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 15)
                .offset(y: 33)
            
            LazyVStack(alignment: .leading) {
                Spacer(minLength: 30)
                Text("메모")
                    .customFont(font: .medium)
                Text(musicMemo.memoText)
                    .multilineTextAlignment(.leading)
                    .customFont()
                HStack {
                    Text("\(musicMemo.lessonType.toTitle)시간")
                        .customFont(font: .medium)
                    Text(musicMemo.endTime.changedToTime(startDate: musicMemo.startTime))
                        .customFont()
                }
                .padding(.top, 10)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(musicMemo.lessonType == .lesson ? Color.ivoryBlue : Color.lemonYellow, lineWidth: 0.4)
                    .shadow(radius: 10)
            )
            .padding(.top, 10)
        }
    }
}
