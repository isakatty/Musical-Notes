//
//  EncourageMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/27/24.
//

import SwiftUI

struct EncourageMemoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("연습 혹은 레슨 일지를 기록해보세요 !")
                .customFont(font: .medium)
                .foregroundStyle(.gray.opacity(0.6))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.4), lineWidth: 0.6)
        )
    }
}
