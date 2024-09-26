//
//  MusicSearchView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct MusicSearchView: View {
    @StateObject var viewModel = MusicSearchViewModel()
    @ObservedObject var parentVM: AddMemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.musics) { item in
                    MusicSearchCompoView(
                        albumImg: item.artwork ?? "",
                        artistName: item.artist,
                        songTitle: item.song,
                        duration: item.durationTime
                    )
                    .onTapGesture {
                        let music = MNotesMusic(
                            id: item.id,
                            songTitle: item.song,
                            artist: item.artist,
                            artwork: item.artwork ?? "",
                            duration: item.durationTime,
                            releaseDate: item.releaseDateStr,
                            albumTitle: item.albumTitle ?? ""
                        )
                        parentVM.selectedMusics.append(music)
                        dismiss()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity)
        .listStyle(.plain)
        .padding(.horizontal)
        .searchable(text: $viewModel.searchTxt)
        .onSubmit(of: .search) {
            Task {
                await viewModel.searchMusic(viewModel.searchTxt)
            }
        }
    }
}
