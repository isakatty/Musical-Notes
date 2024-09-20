//
//  PretendardFontType.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/20/24.
//

import SwiftUI

enum PretendardFontType {
    case black
    case bold
    case extraBold
    case extraLight
    case light
    case medium
    case regular
    case semiBold
    case thin
    
    var toFontName: String {
        switch self {
        case .black: return "Pretendard-Black"
        case .bold: return "Pretendard-Bold"
        case .extraBold: return "Pretendard-ExtraBold"
        case .extraLight: return "Pretendard-ExtraLight"
        case .light: return "Pretendard-Light"
        case .medium: return "Pretendard-Medium"
        case .regular: return "Pretendard-Regular"
        case .semiBold: return "Pretendard-SemiBold"
        case .thin: return "Pretendard-Thin"
        }
    }
}
