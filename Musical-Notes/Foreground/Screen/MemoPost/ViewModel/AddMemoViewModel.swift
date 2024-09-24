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
    
}
