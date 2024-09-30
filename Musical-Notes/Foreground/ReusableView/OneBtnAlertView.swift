//
//  OneBtnAlertView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/30/24.
//

import SwiftUI

struct OneBtnAlertView: View {
    @Binding var isPresented: Bool
    let alertTitle: String
    let alertSubTitle: String
    
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark")
                })
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("앱이름")
                .customFont(font: .medium, fontSize: 17)
                .padding(.bottom, 10)
            
            Text(alertTitle)
                .customFont(font: .medium)
                .multilineTextAlignment(.center)
            
            Text(alertSubTitle)
                .customFont()
                .padding(.top, -5)
            
            Button {
                action()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ivoryBlue)
                    .overlay {
                        Text("확인")
                            .customFont()
                            .foregroundStyle(.white)
                    }
                    .frame(height: 30)
            }
            .padding(.top, 10)
        }
        .frame(maxWidth: 260)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black.opacity(0.1))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                )
        )
    }
}
