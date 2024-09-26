//
//  FeedMusicTitleView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/26/24.
//

import SwiftUI

struct FeedMusicTitleView: View {
    let music: MNotesMusic
    
    var body: some View {
        Text(music.songTitle)
            .multilineTextAlignment(.center)
            .customFont(font: .medium, fontSize: 17)
        Text(music.artist)
            .customFont()
            .padding(.top, -12)
    }
}
