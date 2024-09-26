//
//  MNotesMusic.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import Foundation

import RealmSwift

final class MNotesMusic: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var songTitle: String
    @Persisted var artist: String
    @Persisted var artwork: String
    @Persisted var duration: String
    @Persisted var releaseDate: String
    @Persisted var albumTitle: String
    
    @Persisted var memos: List<MNotesMemo>
    
    convenience init(
        id: String,
        songTitle: String,
        artist: String,
        artwork: String,
        duration: String,
        releaseDate: String,
        albumTitle: String
    ) {
        self.init()
        
        self.id = id
        self.songTitle = songTitle
        self.artist = artist
        self.artwork = artwork
        self.duration = duration
        self.releaseDate = releaseDate
        self.albumTitle = albumTitle
    }
}
