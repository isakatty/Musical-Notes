//
//  CustomPickerView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/2/24.
//

import SwiftUI

struct CustomPickerView: View {
    @Binding var preselectedIndex: Int
    var options: [MNotes]
    let color = Color.ivoryBlue
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                ZStack {
                    Rectangle()
                        .fill(color.opacity(0.2))
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(20)
                        .padding(2)
                        .opacity(preselectedIndex == index ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index].toTitle)
                        .customFont()
                )
            }
        }
        .frame(height: 30)
        .cornerRadius(20)
    }
}
