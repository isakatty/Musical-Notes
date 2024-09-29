//
//  FeedRecordView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/28/24.
//

import SwiftUI

struct FeedRecordView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("To.X")
                .customFont(font: .extraBold, fontSize: 30)
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<2) { index in
                        FeedRecordMemoView()
                    }
                }
                .background(.white)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

#Preview {
    FeedRecordView()
}

