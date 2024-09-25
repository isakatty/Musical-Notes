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
        VStack(spacing: 15) {
            MNotesCarousel(spacing: 30, index: $currentIndex, items: viewModel.musics) { post in
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    AsyncImgView(imgStr: post.artwork, width: size.width, height: size.width)
                        .frame(width: size.width, height: size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            print(post.artwork)
                        }
                }
            }
            .padding(.vertical, 40)
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .onAppear {
            viewModel.fetchMusics()
        }
    }
}

#Preview {
    FeedView()
}
