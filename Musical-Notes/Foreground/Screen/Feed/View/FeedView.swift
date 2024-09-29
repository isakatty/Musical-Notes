//
//  FeedView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Feed")
                .customFont(font: .extraBold, fontSize: 30)
                .padding(.top)
            
            MNotesCarousel(
                spacing: 30,
                index: $currentIndex,
                items: viewModel.musics
            ) { music in
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    VStack(alignment: .center, spacing: 20) {
                        AsyncImgView(
                            imgStr: music.artwork,
                            width: size.width,
                            height: size.width
                        )
                        .frame(width: size.width, height: size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 10)
                        
                        FeedMusicTitleView(music: music)
                        
                        NavigationLink {
                            LazyNavigationView(FeedRecordView(viewModel: FeedRecordViewModel(music: music)))
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.black)
                                .overlay {
                                    Text("\(music.memos.count) RECORDS")
                                        .customFont(font: .extraBold, fontSize: 18)
                                        .foregroundStyle(.white)
                                }
                                .frame(width: max(size.width - 60, 80), height: 60)
                        }
                    }
                }
            }
            .padding(.vertical, 40)
        }
        .padding(.horizontal)
        .onAppear {
            // MARK: onAppear마다 fetch가 맞을까 ?
            viewModel.fetchMusics()
        }
    }
}
