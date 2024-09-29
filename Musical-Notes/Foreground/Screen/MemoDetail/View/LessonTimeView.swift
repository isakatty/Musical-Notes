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
                Text("\(lessonType.toTitle) 시작 시간")
                    .customFont(fontSize: 14)
                Text(startTime)
                    .customFont()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Rectangle()
                .fill().opacity(0.6)
                .frame(width: 1)
            
            VStack(alignment: .center) {
                Text("\(lessonType.toTitle) 마무리 시간")
                    .customFont(fontSize: 14)
                Text(endTime)
                    .customFont()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity)
    }
}
