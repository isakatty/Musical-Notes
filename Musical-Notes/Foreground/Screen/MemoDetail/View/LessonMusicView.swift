//
//  LessonMusicView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct LessonMusicView: View {
    let imgStr: String
    let width: CGFloat
    let height: CGFloat
    
    let artist: String
    let songTitle: String
    let duration: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AsyncImgView(imgStr: imgStr, width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 10) {
                MusicInfoDetailView(category: "가수", memoDetail: artist)
                MusicInfoDetailView(category: "곡", memoDetail: songTitle)
                MusicInfoDetailView(category: "재생 시간", memoDetail: duration)
            }
        }
    }
}
