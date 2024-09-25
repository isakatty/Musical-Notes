//
//  AlertModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import SwiftUI

private struct AlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let alertTitle: String
    let alertSubTitle: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            ZStack {
                if isPresented {
                    Rectangle()
                        .fill(.black.opacity(0.5))
                        .blur(radius: isPresented ? 2 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.isPresented = false
                        }
                    
                    AlertMusicView(isPresented: $isPresented, alertTitle: alertTitle, alertSubTitle: alertSubTitle)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(
                isPresented
                ? .spring(response: 0.3)
                : .none,
                value: isPresented
            )
        }
    }
}

extension View {
    func showAlert(isPresented: Binding<Bool>, alertTitle: String, alertSubTitle: String) -> some View {
        modifier(AlertModifier(isPresented: isPresented, alertTitle: alertTitle, alertSubTitle: alertSubTitle))
    }
}
