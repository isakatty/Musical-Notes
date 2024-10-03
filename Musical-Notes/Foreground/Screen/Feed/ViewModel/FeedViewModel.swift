//
//  FeedViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/26/24.
//

import Foundation
import RealmSwift

final class FeedViewModel: ObservableObject {
    @Published var musics = [MNotesMusic]()
    
    func fetchMusics() {
        RealmRepository.shared.removeMusics()
        musics = Array(RealmRepository.shared.fetchMusics())
    }
}
