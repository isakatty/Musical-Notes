//
//  TabBarButtonStyle.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct TabBarButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}
