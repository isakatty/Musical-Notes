//
//  LessonMemoDetailViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/26/24.
//

import Foundation

final class LessonMemoDetailViewModel: ObservableObject {
    @Published var musicMemo: MNotesMemo
    
    init(musicMemo: MNotesMemo) {
        self.musicMemo = musicMemo
    }
    
    func removeMemo() {
        RealmRepository.shared.removeMemo(memo: musicMemo)
        musicMemo = MNotesMemo()
    }
}
