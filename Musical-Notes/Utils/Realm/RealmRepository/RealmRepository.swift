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
    
    func addMemoToMusic(musics: [MNotesMusic], memo: MNotesMemo) {
        do {
            try realm.write {
                addMemo(memo: memo)
                
                for music in musics {
                    addMusic(music: music)
                    music.memos.append(memo)
                }
            }
        } catch {
            print("Realm Memo Save Fail")
        }
    }
    
    func addMusic(music: MNotesMusic) {
        realm.add(music)
    }
    
    func addMemo(memo: MNotesMemo) {
        if realm.object(ofType: MNotesMemo.self, forPrimaryKey: memo.id) == nil {
            realm.add(memo)
        }
    }
}
