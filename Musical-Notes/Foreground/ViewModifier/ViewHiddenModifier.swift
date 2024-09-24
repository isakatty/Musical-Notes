//
//  ViewHiddenModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/24/24.
//

import SwiftUI

private struct ViewHiddenModifier: ViewModifier {
    let isHidden: Bool
    
    @ViewBuilder func body(content: Content) -> some View {
        if isHidden {
            content.hidden()
        } else {
            content
        }
    }
}

extension View {
    func hideView(_ isHiddden: Bool) -> some View {
        modifier(ViewHiddenModifier(isHidden: isHiddden))
    }
}
