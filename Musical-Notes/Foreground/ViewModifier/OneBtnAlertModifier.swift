//
//  OneBtnAlertModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/30/24.
//

import SwiftUI

private struct OneBtnAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let alertTitle: String
    let alertSubTitle: String
    var action: () -> Void
    
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
                    
                    OneBtnAlertView(isPresented: $isPresented, alertTitle: alertTitle, alertSubTitle: alertSubTitle, action: action)
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
    func showOneBtnAlert(isPresented: Binding<Bool>, alertTitle: String, alertSubTitle: String, action: @escaping () -> Void) -> some View {
        modifier(OneBtnAlertModifier(isPresented: isPresented, alertTitle: alertTitle, alertSubTitle: alertSubTitle, action: action))
    }
}
