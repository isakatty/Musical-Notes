//
//  FeedRecordViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/29/24.
//

import Foundation
import RealmSwift

final class FeedRecordViewModel: ObservableObject {
    @Published var music: MNotesMusic
    
    init(music: MNotesMusic) {
        self.music = music
    }
}
