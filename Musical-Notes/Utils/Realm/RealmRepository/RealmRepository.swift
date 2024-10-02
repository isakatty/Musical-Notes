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
                    addMusic(music: music, memo: memo)
                }
            }
        } catch {
            print("Realm Memo Save Fail")
        }
    }
    
    func addMusic(music: MNotesMusic, memo: MNotesMemo) {
        if let existingMusic = realm.object(ofType: MNotesMusic.self, forPrimaryKey: music.id) {
            if !existingMusic.memos.contains(memo) {
                existingMusic.memos.append(memo)
            }
        } else {
            music.memos.append(memo)
            realm.add(music)
        }
    }
    
    func addMemo(memo: MNotesMemo) {
        if realm.object(ofType: MNotesMemo.self, forPrimaryKey: memo.id) == nil {
            realm.add(memo)
        }
    }
    
    func fetchMusics() -> Results<MNotesMusic> {
        return realm.objects(MNotesMusic.self)
    }
    
    func removeMusics() {
        let allMusics = realm.objects(MNotesMusic.self)
        
        for music in allMusics {
            do {
                try realm.write {
                    if findMemoInMusic(music: music) {
                        realm.delete(music)
                    }
                }
            } catch {
                print("Music 삭제 실패")
            }
        }
    }
    
    func findMemoInMusic(music: MNotesMusic) -> Bool {
        return music.memos.isEmpty ? true : false
    }
    
    func filterMemoWithDate(selected: Date) -> Results<MNotesMemo> {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: selected)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        return realm.objects(MNotesMemo.self).where { memo in
            memo.regDate >= startOfDay && memo.regDate < endOfDay
        }
    }
    func removeMemo(memo: MNotesMemo) {
        do {
            try realm.write {
                realm.delete(memo)
            }
        } catch {
            print("delete Error")
        }
    }
}
