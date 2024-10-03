//
//  FeedRecordListView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/3/24.
//

import SwiftUI

struct FeedRecordListView: View {
    var memo: MNotesMemo
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.ivoryBlue, lineWidth: 0.6)
            .frame(height: 40)
            .overlay {
                HStack {
                    Text("\(index + 1)")
                        .customFont(font: .semiBold)
                    Spacer()
                    Text(memo.lessonType.toTitle)
                        .customFont()
                    Spacer()
                    Text(memo.regDate.formattedString(dateFormat: .yearMonthDay))
                        .customFont()
                }
                .padding(.horizontal)
            }
    }
}
