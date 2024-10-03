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
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(memo.lessonType.toTitle)
                        .customFont(font: .thin, fontSize: 13)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("\(memo.music.first?.artist ?? "")")
                        .customFont(font: .regular, fontSize: 14)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("\(memo.music.first?.songTitle ?? "")")
                        .customFont(font: .medium, fontSize: 17)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            }
            .padding(.leading, 4)
        }
        .padding(.horizontal, 8)
        .frame(height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.ivoryBlue, lineWidth: 0.6)
        )
    }
}
