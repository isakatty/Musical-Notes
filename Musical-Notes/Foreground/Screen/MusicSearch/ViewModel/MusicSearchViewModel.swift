//
//  MusicSearchViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation
import MusicKit

protocol MusicRepositoryDelegate: AnyObject {
    func musicAuthorizationDidChange(isAuthorized: Bool) async
}

@MainActor
final class MusicSearchViewModel: ObservableObject, MusicRepositoryDelegate {
    var repository = MusicRepository()
    
    @Published var searchTxt: String = ""
    @Published var musics = [SearchedSong]()
    @Published var isAuthorized: Bool = false
    @Published var isLoading: Bool = false
    @Published var hasNextBatch: Bool = false

    private var searchOffset: Int = 0
    private var isFetching: Bool = false
    
    init() {
        print("== searchViewModel init ==")
        repository.delegate = self
        isAuthorized = !repository.isMusicAuthorized
    }
    
    func searchMusic(_ txt: String, isNewSearch: Bool = false) async {
        guard !isFetching else { return }
        
        isFetching = true
        defer { isFetching = false }
        
        if isNewSearch {
            searchOffset = 0
            musics.removeAll()
        }
        
        isLoading = true
        let result = await repository.fetchMusic(txt, offset: searchOffset)
        isLoading = false

        musics.append(contentsOf: result.songs)
        hasNextBatch = result.hasNextBatch

        if hasNextBatch {
            searchOffset += 25
        }
    }
    
    func musicAuthorizationDidChange(isAuthorized: Bool) {
        self.isAuthorized = !isAuthorized
    }
    
    func fetchMoreIfNeeded(currentItem: SearchedSong) async {
        guard hasNextBatch, !isFetching else { return }
        
        let thresholdIndex = musics.index(musics.endIndex, offsetBy: -5)
        if let currentIndex = musics.firstIndex(where: { $0.id == currentItem.id }), currentIndex >= thresholdIndex {
            await searchMusic(searchTxt)
        }
    }
}
