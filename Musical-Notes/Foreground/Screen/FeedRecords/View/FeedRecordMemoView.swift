//
//  FeedRecordMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/29/24.
//

import SwiftUI

struct FeedRecordMemoView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 120, height: 34)
            .overlay {
                Text("24.09.26")
                    .customFont(font: .bold)
                    .foregroundStyle(.white)
            }
            .offset(x: 15)
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.4)
                .shadow(radius: 10)
            LazyVStack(alignment: .leading) {
                Spacer(minLength: 30)
                Text("메모")
                    .customFont(font: .medium)
                Text("오늘은 119BPM 연습함 \n쉬빚 않아서 연습을 더 해야겠따 생각햇다. \n어쩌구 저쩌구 오늘은 덥고 반팔로 갈아입고\n내일은 뭐하지 애닝릉ㄴ 이거저거")
                    .multilineTextAlignment(.leading)
                    .customFont()
                HStack {
                    Text("01:10:52")
                        .makeCategoryView("연습시간")
                        .customFont()
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .offset(y: -30)
    }
}

#Preview {
    FeedRecordMemoView()
}
