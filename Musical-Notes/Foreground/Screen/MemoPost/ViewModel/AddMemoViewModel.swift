//
//  AddMemoViewModel.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import Foundation

final class AddMemoViewModel: ObservableObject {
    // MARK: 레슨일지인지 연습일지인지 enum으로 받아야함.
    @Published var memoDate: Date
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var memoText: String = ""
    
    @Published var selectedMusics: [MNotesMusic] = []
    @Published var selectedSeg: Int = 0
    
    init(memoDate: Date) {
        self.memoDate = memoDate
    }
    
    func validateInfo() -> Bool {
        guard !memoText.isEmpty else {
            return false
        }
        if isControlMidNight() {
            return true
        }
        guard endTime > startTime else {
            print("??")
            return false
        }
        return true
    }
    func saveMemo(memoDate: Date, start: Date, end: Date, memo: String, musics: [MNotesMusic]) {
        var adjustedEnd = end
            
        if end < start {
            adjustedEnd = Calendar.current.date(byAdding: .day, value: 1, to: end) ?? Date()
        }
    
        let memo = MNotesMemo(regDate: memoDate, startTime: start, endTime: adjustedEnd, memoText: memo, lessonType: MNotes(rawValue: selectedSeg) ?? .practice)
        RealmRepository.shared.addMemoToMusic(musics: musics, memo: memo)
    }
    
    private func isControlMidNight() -> Bool {
        let calendar = Calendar.current
        let startComponents = calendar.dateComponents([.hour, .minute], from: startTime)
        let endComponents = calendar.dateComponents([.hour, .minute], from: endTime)
        
        if let startHour = startComponents.hour,
           let endHour = endComponents.hour {
            if startHour >= 18 && startHour <= 23 && endHour >= 0 && endHour <= 5 && endTime < startTime {
                return true
            }
        }
        
        return false
    }
}
