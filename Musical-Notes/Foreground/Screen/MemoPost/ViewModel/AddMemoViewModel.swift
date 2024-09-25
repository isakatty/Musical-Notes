//
//  AddMemoViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import Foundation

final class AddMemoViewModel: ObservableObject {
    // MARK: 레슨일지인지 연습일지인지 enum으로 받아야함.
    @Published var memoDate: Date = Date()
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var memoText: String = ""
    
    func validateInfo() -> Bool {
        guard !memoText.isEmpty else {
            return false
        }
        guard endTime > startTime else {
            return false
        }
        return true
    }
    
    func saveMemo(memoDate: Date, start: Date, end: Date, memo: String, musics: [MNotesMusic]) {
        let memo = MNotesMemo(regDate: memoDate, startTime: start, endTime: end, memoText: memo, lessonType: .practice)
        RealmRepository.shared.addMemoToMusic(musics: musics, memo: memo)
    }
}
