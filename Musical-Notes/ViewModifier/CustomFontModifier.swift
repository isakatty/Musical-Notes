//
//  CustomFontModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/20/24.
//

import SwiftUI

private struct CustomFontModifier: ViewModifier {
    var font: PretendardFontType
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(font.toFontName, size: fontSize))
    }
}

extension View {
    func customFont(font: PretendardFontType = .regular, fontSize: CGFloat = 15) -> some View {
        modifier(CustomFontModifier(font: font, fontSize: fontSize))
    }
}
