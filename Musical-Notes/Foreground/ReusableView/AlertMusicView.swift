//
//  AlertMusicView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import SwiftUI

struct AlertMusicView: View {
    @Binding var isPresented: Bool
    @State private var isRotating = false
    let alertTitle: String
    let alertSubTitle: String
    
    private var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
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
            
            Image("CD")
                .resizable()
                .frame(width: 140, height: 140)
                .padding(.vertical, 20)
                .rotationEffect(
                    Angle(degrees: isRotating ? 360 : 0),
                    anchor: .center
                )
                .animation(foreverAnimation, value: isRotating)
                .onAppear {
                    withAnimation(foreverAnimation) {
                        isRotating = true
                    }
                }
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text("iPhone")
                    .customFont(font: .light, fontSize: 12)
                    .foregroundColor(.gray.opacity(0.6))
                Text(alertTitle)
                    .customFont()
                Text(alertSubTitle)
                    .customFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 15)
            
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.yellow)
                Spacer()
                Image(systemName: "backward.fill")
                Spacer()
                Image(systemName: "pause.fill")
                Spacer()
                Image(systemName: "forward.fill")
                Spacer()
                Image(systemName: "shareplay.slash")
                    .foregroundStyle(.gray.opacity(0.6))
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("2:58")
                
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .frame(width: 140,height: 10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 0.4)
                                }
                                .position(x: 70, y: geo.size.height / 2)
                        }
                }
                
                Text("-0:55")
            }
            .customFont(font: .medium, fontSize: 14)
            .frame(height: 10)
            .padding(.bottom, 15)
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

#Preview {
    AlertMusicView(
        isPresented: .constant(false),
        alertTitle: "일지를 작성하기에 부족한 정보가 있습니다.",
        alertSubTitle: "다시 한 번 확인해주세요."
    )
}
