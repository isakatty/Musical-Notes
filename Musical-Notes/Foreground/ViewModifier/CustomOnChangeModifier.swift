//
//  CustomOnChangeModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/3/24.
//

import SwiftUI

private struct CustomOnChangeModifier: ViewModifier {
    var count: Int
    @Binding var currentIndex: Int
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .onChange(of: count) { oldValue, newValue in
                    if newValue < oldValue {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }
        } else {
            content
                .onChange(of: count) { value in
                    if value < count {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }
        }
    }
}

extension View {
    func customOnChange(count: Int, currentIndex: Binding<Int>) -> some View {
        modifier(CustomOnChangeModifier(count: count, currentIndex: currentIndex))
    }
}
