//
//  ButtonActionModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct ButtonActionModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            content
        }
    }
}
extension View {
    func wrapToButton(_ action: @escaping () -> Void) -> some View {
        modifier(ButtonActionModifier(action: action))
    }
}
