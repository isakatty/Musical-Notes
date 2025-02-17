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
    
    init() {
        print("== searchViewModel init ==")
        repository.delegate = self
        isAuthorized = !repository.isMusicAuthorized
    }
    
    func searchMusic(_ txt: String, isNewSearch: Bool = false) async {
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
    
    func fetchMoreIfNeeded() async {
        guard hasNextBatch else { return }
        
        await searchMusic(searchTxt)
    }
    
    func musicAuthorizationDidChange(isAuthorized: Bool) {
        self.isAuthorized = !isAuthorized
    }
}
