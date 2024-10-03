//
//  MusicRepository.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation
import MusicKit

final class MusicRepository {
    @Published var isMusicAuthorized: Bool = false
    weak var delegate: MusicRepositoryDelegate?
    
    init() {
        print("== Music Repository init ==")
        
        Task {
            await requestMusicAuthorization()
        }
    }
    
    func fetchMusic(_ txt: String, offset: Int = 0) async -> MusicSearchResult {
        if isMusicAuthorized {
            var request = MusicCatalogSearchRequest(term: txt, types: [Song.self])
            request.limit = 25
            request.offset = offset
            
            let result = try? await request.response()
            
            guard let result else {
                print("result 없음")
                return MusicSearchResult(songs: [], hasNextBatch: false)
            }
            
            let searchedSongs = result.songs.map { song in
                let artworkURLStr = song.artwork?.url(width: 300, height: 300)?.absoluteString
                return SearchedSong(
                    id: song.id.rawValue,
                    song: song.title,
                    artist: song.artistName,
                    artwork: artworkURLStr,
                    duration: song.duration,
                    releaseDate: song.releaseDate,
                    albumTitle: song.albumTitle
                )
            }
            
            let hasNextBatch = result.songs.hasNextBatch
            
            return MusicSearchResult(songs: searchedSongs, hasNextBatch: hasNextBatch)
        } else {
            return MusicSearchResult(songs: [], hasNextBatch: false)
        }
    }
    
    func requestMusicAuthorization() async {
        let status = await MusicAuthorization.request()
        
        switch status {
        case .authorized:
            isMusicAuthorized = true
        case .notDetermined:
            print("Error getting Apple Music Authorization: Not determined")
            isMusicAuthorized = false
        case .restricted:
            print("Error getting Apple Music Authorization: Restricted")
            isMusicAuthorized = false
        case .denied:
            print("Error getting Apple Music Authorization: Denied")
            isMusicAuthorized = false
        default:
            print("Error getting Apple Music Authorization: Unknown (New case)")
            isMusicAuthorized = false
        }
        
        await delegate?.musicAuthorizationDidChange(isAuthorized: isMusicAuthorized)
    }
}
