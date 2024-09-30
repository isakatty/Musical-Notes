//
//  LessonTimeCircleView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct LessonTimeCircleView: View {
    var total: Int
    var progress: Int
    var totalTime: String

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(
                    .ivoryBlue.opacity(0.3),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .frame(width: 120, height: 120)
            
            let effectiveProgress = (progress % 60 == 0) ? 60 : min(progress, progress % 60)
            Circle()
                .trim(from: 0, to: CGFloat(effectiveProgress) / CGFloat(total))
                .stroke(
                    .ivoryBlue.opacity(0.7),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 120, height: 120)
                .animation(.easeInOut, value: progress)
            
            Text(totalTime)
                .customFont(font: .semiBold, fontSize: 20)
        }
    }
}
