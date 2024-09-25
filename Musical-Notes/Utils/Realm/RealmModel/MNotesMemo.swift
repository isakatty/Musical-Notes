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
    
    @Persisted(originProperty: "memos") var music: LinkingObjects<MNotesMusic>
    
    convenience init(
        regDate: Date,
        startTime: Date,
        endTime: Date,
        memoText: String,
        lessonType: MNotes
    ) {
        self.init()
        
        self.regDate = regDate
        self.startTime = startTime
        self.endTime = endTime
        self.memoText = memoText
        self.lessonType = lessonType
    }
    
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
