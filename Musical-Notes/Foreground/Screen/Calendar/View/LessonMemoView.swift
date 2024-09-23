//
//  LessonMemoView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct LessonMemoView: View {
    let memo: String
    
    var body: some View {
        ZStack {
            Text(memo)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
                .customFont()
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.6)
                .opacity(0.4)
        }
    }
}
