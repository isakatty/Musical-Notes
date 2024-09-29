//
//  FeedRecordView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/28/24.
//

import SwiftUI

struct FeedRecordView: View {
    @StateObject var viewModel: FeedRecordViewModel
    
    init(viewModel: FeedRecordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.music.songTitle) - \(viewModel.music.artist)")
                .customFont(font: .extraBold, fontSize: 30)
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.music.memos) { memo in
                        FeedRecordMemoView(musicMemo: memo)
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

