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
        
        print(makeTimeUI())
    }
    
    func makeTimeUI() -> (String, String) {
        return (differenceTime().timeFormat, "")
    }
    
    private func differenceTime() -> Int {
        return Int(musicMemo.endTime.timeIntervalSince(musicMemo.startTime))
    }
}
