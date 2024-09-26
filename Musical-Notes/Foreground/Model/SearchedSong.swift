//
//  SearchedSong.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import Foundation

struct SearchedSong: Hashable, Identifiable {
    let id: String
    let song: String
    let artist: String
    let artwork: String?
    let duration: TimeInterval?
    let releaseDate: Date?
    let albumTitle: String?
    
    var durationTime: String {
        guard let duration else { return "" }
        
        return duration.strFormatted()
    }
    var releaseDateStr: String {
        guard let releaseDate else { return Date().formattedString(dateFormat: .yearMonthDay) }
        return releaseDate.formattedString(dateFormat: .yearMonthDay)
    }
}
