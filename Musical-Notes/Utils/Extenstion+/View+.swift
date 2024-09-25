//
//  View+.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
