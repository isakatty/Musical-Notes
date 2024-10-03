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
    @Environment(\.scenePhase) var scenePhase
    
    @State private var searchOffSet: Int = 0
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if viewModel.musics.isEmpty {
                    Text("음악을 검색해주세요")
                        .customFont()
                } else {
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
                if viewModel.hasNextBatch {
                    ProgressView()
                        .onAppear {
                            searchOffSet += 25
                            Task {
                                await viewModel.searchMusic(viewModel.searchTxt, offset: searchOffSet)
                            }
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
            viewModel.musics = []
            Task {
                await viewModel.searchMusic(viewModel.searchTxt, offset: searchOffSet)
            }
        }
        .showOneBtnAlert(isPresented: $viewModel.isAuthorized, alertTitle: "권한 설정이 필요합니다.", alertSubTitle: "음악 검색을 위해서는 미디어 권한 설정을 허용해야 가능합니다.", btnText: "설정으로 이동") {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}
