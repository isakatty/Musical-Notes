//
//  FeedDetailRectangleView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/3/24.
//

import SwiftUI

struct FeedDetailRectangleView: View {
    var music: MNotesMusic
    
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
            .fill(.white)
            .frame(maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            .shadow(radius: 3)
            .offset(y: 90)
            .overlay {
                VStack {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        FeedRecordDetailView(music: music)
                        EmptyView()
                            .makeCategoryView("기록")
                        ScrollView {
                            LazyVStack {
                                ForEach(Array(music.memos.enumerated()), id: \.element.id) { index, item in
                                    NavigationLink {
                                        LazyNavigationView(LessonDetailView(viewModel: .init(musicMemo: item)))
                                    } label: {
                                        FeedRecordListView(memo: item, index: index)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .offset(y: 170)
            }
    }
}
