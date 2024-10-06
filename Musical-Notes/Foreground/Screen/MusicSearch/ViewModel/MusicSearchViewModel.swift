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
    
    init() {
        print("== searchViewModel init ==")
        
        repository.delegate = self
        isAuthorized = !repository.isMusicAuthorized
    }
    
    func searchMusic(_ txt: String, offset: Int = 0) async {
        isLoading = true
        defer { isLoading = false }
        
        let result = await repository.fetchMusic(txt, offset: offset)
        musics.append(contentsOf: result.songs)
        hasNextBatch = result.hasNextBatch
    }
    
    func musicAuthorizationDidChange(isAuthorized: Bool) {
        self.isAuthorized = !isAuthorized
    }
}
