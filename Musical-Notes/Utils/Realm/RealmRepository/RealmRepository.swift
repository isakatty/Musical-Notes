//
//  RealmRepository.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import Foundation

import RealmSwift

final class RealmRepository {
    static let shared = RealmRepository()
    
    private var realm = try! Realm()
    
    private init() {
        print("== RealmRepo init ==")
        print("\(realm.configuration.fileURL)")
    }
    
    func fetchMemos() -> Results<MNotesMemo> {
        return realm.objects(MNotesMemo.self)
    }
    
    func addMemo(memo: MNotesMemo) {
        do {
            try realm.write {
                realm.add(memo)
            }
        } catch {
            print("Realm Memo Save Fail")
        }
    }
}
