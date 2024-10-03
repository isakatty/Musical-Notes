//
//  FeedRecordTestView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/2/24.
//

import SwiftUI

struct FeedRecordTestView: View {
    var music: MNotesMusic
    
    var body: some View {
        ZStack(alignment: .top) {
            FeedDetailRectangleView(music: music)
            AsyncImgView(imgStr: music.artwork, width: 150, height: 150)
                .frame(width: 150, height: 150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondaryBG)
    }
}
