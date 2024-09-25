//
//  MusicSearchViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation
import MusicKit

@MainActor
final class MusicSearchViewModel: ObservableObject {
    private let repository = MusicRepository()
    
    @Published var searchTxt: String = ""
    @Published var musics = [SearchedSong]()
    
    init() {
        print("== searchViewModel init ==")
    }
    
    func searchMusic(_ txt: String) async {
        musics = await repository.fetchMusic(txt)
    }
}
