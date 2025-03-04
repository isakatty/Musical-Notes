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
    
    @State private var searchBarText: String = ""
    
    var body: some View {
        VStack {
            searchBar(searchText: $searchBarText)
                .onSubmit {
                    viewModel.changedText(text: searchBarText)
                    
                    Task {
                        await viewModel.searchMusic(isNewSearch: true)
                    }
                }
                .padding(.horizontal)

            ScrollView {
                LazyVStack {
                    if viewModel.isLoading && viewModel.musics.isEmpty {
                        ProgressView("음악 검색 중!")
                            .padding()
                    } else if viewModel.musics.isEmpty {
                        Text("음악을 검색해주세요").customFont()
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
                    if viewModel.hasNextBatch && !viewModel.isLoading {
                        ProgressView("데이터 로딩 중...")
                            .onAppear {
                                Task {
                                    await viewModel.fetchMoreIfNeeded()
                                }
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .showOneBtnAlert(
            isPresented: $viewModel.isAuthorized,
            alertTitle: "권한 설정이 필요합니다.",
            alertSubTitle: "음악 검색을 위해서는 미디어 권한 설정을 허용해야 가능합니다.",
            btnText: "설정으로 이동"
        ) {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
    
    
    @ViewBuilder
    private func searchBar(searchText: Binding<String>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.35))
                .frame(height: 44)
            
            TextField(text: searchText) {
                HStack {
                    Text("오늘 연습한 곡을 찾아보세요 :) ")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
            }
            .padding(.leading, 16)
        }
    }
}

