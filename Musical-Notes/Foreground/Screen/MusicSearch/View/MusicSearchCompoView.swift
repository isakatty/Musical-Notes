//
//  MusicSearchCompoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import SwiftUI

struct MusicSearchCompoView: View {
    let albumImg: String
    let artistName: String
    let songTitle: String
    let duration: String
    
    var body: some View {
        HStack {
            AsyncImgView(imgStr: albumImg, width: 80, height: 80)
                .padding(.trailing, 16)
            VStack(alignment: .leading, spacing: 10) {
                Text(songTitle)
                    .customFont(font: .semiBold)
                HStack {
                    Text(artistName)
                    Circle()
                        .frame(width: 3, height: 3)
                    Text(duration)
                }
                .customFont(fontSize: 14)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MusicSearchCompoView(
        albumImg: "",
        artistName: "아이유",
        songTitle: "Love wins all",
        duration: "04:31"
    )
}
