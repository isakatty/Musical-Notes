//
//  MusicSearchView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

let test =  "https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/c8/3c/3b/c83c3b28-0d78-bc48-5ae5-d523f07ef5d8/888272138375.jpg/150x150bb.jpg"

struct MusicSearchView: View {
    @StateObject var viewModel = MusicSearchViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.musics) { item in
                    // search 결과로 들어올 것.
                    MusicSearchCompoView(albumImg: item.artwork ?? test, artistName: item.artist, songTitle: item.song, duration: item.durationTime)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .searchable(text: $viewModel.searchTxt)
        .onSubmit(of: .search) {
            Task {
                await viewModel.searchMusic(viewModel.searchTxt)
            }
        }
    }
}

#Preview {
//    NavigationStack {
//        AddMemoView(viewModel: AddMemoViewModel())
//    }
    NavigationStack {
        MusicSearchView()
    }
}
