//
//  MNotesMemo.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import Foundation

import RealmSwift

final class MNotesMemo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var regDate: Date
    @Persisted var startTime: Date
    @Persisted var endTime: Date
    @Persisted var memoText: String
    @Persisted var lessonType: MNotes
    
    @Persisted var songs: List<MNotesMusic>
}

enum MNotes: String, PersistableEnum {
    case lesson
    case practice
    
    var toTitle: String {
        switch self {
        case .lesson: return "레슨"
        case .practice: return "연습"
        }
    }
}
