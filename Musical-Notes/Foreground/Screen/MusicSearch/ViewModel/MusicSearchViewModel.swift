//
//  MusicSearchViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation
import MusicKit

protocol MusicRepositoryDelegate: AnyObject {
    func musicAuthorizationDidChange(isAuthorized: Bool)
}

@MainActor
final class MusicSearchViewModel: ObservableObject, MusicRepositoryDelegate {
    var repository = MusicRepository()
    
    @Published var searchTxt: String = ""
    @Published var musics = [SearchedSong]()
    @Published var isAuthorized: Bool = false
    
    init() {
        print("== searchViewModel init ==")
        
        // repository의 delegate로 viewModel 설정
        repository.delegate = self
        
        // 초기 권한 상태 반영
        isAuthorized = !repository.isMusicAuthorized
    }
    
    func searchMusic(_ txt: String) async {
        musics = await repository.fetchMusic(txt)
    }
    
    // MusicRepositoryDelegate 프로토콜 구현
    func musicAuthorizationDidChange(isAuthorized: Bool) {
        self.isAuthorized = !isAuthorized
    }
}
