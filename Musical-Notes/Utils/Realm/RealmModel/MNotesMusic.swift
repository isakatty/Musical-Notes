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
    
    @Persisted var memos: List<MNotesMemo>
    
    convenience init(
        id: String,
        songTitle: String,
        artist: String,
        artwork: String
    ) {
        self.init()
        
        self.id = id
        self.songTitle = songTitle
        self.artist = artist
        self.artwork = artwork
    }
}