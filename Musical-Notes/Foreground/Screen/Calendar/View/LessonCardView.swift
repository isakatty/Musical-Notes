//
//  LessonCardView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct LessonCardView: View {
    // MARK: Memo 받아야함
    let testImgStr: String = "https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/c8/3c/3b/c83c3b28-0d78-bc48-5ae5-d523f07ef5d8/888272138375.jpg/150x150bb.jpg"
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: testImgStr)) { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading) {
                    Text("Lesson")
                        .customFont(font: .thin, fontSize: 13)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("Amber-Simone | Black, no Sugar")
                        .customFont(font: .regular, fontSize: 14)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("Potential")
                        .customFont(font: .medium, fontSize: 17)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Rectangle()
                .fill(.black.opacity(0.7))
                .frame(height: 0.8)
            MusicInfoDetailView(category: "레슨시간", memoDetail: "01:12:50")
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 0.6)
        )
    }
}

#Preview {
    LessonCardView()
}
