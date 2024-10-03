//
//  FeedRecordDetailView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/3/24.
//

import SwiftUI

struct FeedRecordDetailView: View {
    var music: MNotesMusic
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 30) {
                TitleCategoryView(title: "아티스트", content: music.artist)
                TitleCategoryView(title: "제목", content: music.songTitle)
                TitleCategoryView(title: "앨범", content: music.albumTitle)
            }
            Divider()
        }
    }
}
