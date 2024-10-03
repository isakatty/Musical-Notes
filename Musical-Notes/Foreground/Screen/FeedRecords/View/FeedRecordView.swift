//
//  FeedRecordView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/28/24.
//

import SwiftUI

struct FeedRecordView: View {
    @StateObject var viewModel: FeedRecordViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: FeedRecordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            FeedRecordTestView(music: viewModel.music)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(viewModel.music.songTitle)
        .background(Color.secondaryBG)
        .onAppear {
            viewModel.fetchMusic()
            
            if viewModel.music.memos.isEmpty {
                dismiss()
            }
        }
    }
}

