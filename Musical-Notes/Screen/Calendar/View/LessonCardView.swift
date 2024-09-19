//
//  LessonCardView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct LessonCardView: View {
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
                    Text("Lesson | Amber-Simone ")
                        .font(.callout)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    Text("Potential")
                        .font(.title3)
                }
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Rectangle()
                .frame(height: 2)
            memo(category: "레슨시간", memoDetail: "01:12:50")
//            memo(category: "메모", memoDetail: """
//로렘픽섬 어쩌구 저쩌구
//이것 저것
//""")
        }
        .padding()
        .background(
            Color.gray.opacity(0.4)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func memo(category: String, memoDetail: String) -> some View {
        HStack(alignment: .center) {
            Circle()
                .frame(width: 5, height: 5)
            Text(category)
                .frame(width: 80, alignment: .leading)
            
            Text(memoDetail)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LessonCardView()
}
