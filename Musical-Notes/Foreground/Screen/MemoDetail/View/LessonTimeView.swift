//
//  LessonTimeView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct LessonTimeView: View {
    let startTime: String
    let endTime: String
    let lessonType: MNotes
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Text("시작 시간")
                    .customFont(fontSize: 14)
                Text(startTime)
                    .customFont()
            }
            Rectangle()
                .fill(.black.opacity(0.6))
                .frame(height: 1)
            
            VStack(alignment: .center) {
                Text("마무리 시간")
                    .customFont(fontSize: 14)
                Text(endTime)
                    .customFont()
            }
        }
    }
}
