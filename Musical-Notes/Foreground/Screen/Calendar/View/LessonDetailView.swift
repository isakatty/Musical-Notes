//
//  LessonDetailView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/20/24.
//

import SwiftUI

struct LessonDetailView: View {
    // MARK: Memo id 혹은 memo 전체 받기.
    private let testImgStr: String = "https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/c8/3c/3b/c83c3b28-0d78-bc48-5ae5-d523f07ef5d8/888272138375.jpg/150x150bb.jpg"
    @State private var testTE: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 12) {
                Text("2024년 09월 21일(토)")
                    .customFont(font: .medium, fontSize: 16)
                    .foregroundStyle(Color(uiColor: UIColor.darkGray).opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: view2 - 시간
                
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("레슨 시작 시간")
                            .customFont(fontSize: 14)
                        Text("12:17 A.M.")
                            .customFont()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Rectangle()
                        .fill().opacity(0.6)
                        .frame(width: 1)
                    
                    VStack(alignment: .center) {
                        Text("레슨 끝 시간")
                            .customFont(fontSize: 14)
                        Text("13:47 A.M.")
                            .customFont()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                
                // MARK: 체크박스
                ForEach(0..<2) { index in
                    HStack(alignment: .center, spacing: 10) {
                        HStack {
                            Image(systemName: "checkmark.square.fill")
                            Text("기본 연습")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Image(systemName: "checkmark.square.fill")
                            Text("크로매틱 연습")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .customFont()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // MARK: view3 - 메모(TextEditor)
                Text("오늘 레슨 메모")
                    .customFont(font: .bold, fontSize: 17)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack {
                    TextEditor(text: .constant("어쩌구 저쩌구 이런 저런 로렘픽섬alskdjfpoqwieflaksdjfl;aksdjflkasjdflkasdalksdjf kasjdfaskdjflaskdj \n 민어래댜미ㅏ얼 \n 최고티비 \n 커스텀 TextEditor를 만들어야 할 듯 ? \n Dynamic height을 갖는.. TextEditor \n 늘어나면 \n 늘어나야함."))
                        .frame(maxWidth: .infinity, minHeight: 180, maxHeight: .infinity)
                        .customFont()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.6)
                        .opacity(0.4)
                }
                
                Text("오늘 레슨 곡")
                    .customFont(font: .bold, fontSize: 17)
                    .frame(maxWidth: .infinity, alignment: .leading)
                // MARK: view1 - About Song - ForEach
                HStack(alignment: .center, spacing: 10) {
                    AsyncImage(url: URL(string: testImgStr)){ image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        memo(category: "가수", memoDetail: "406호 프로젝트")
                        memo(category: "곡", memoDetail: "Colorful")
                        memo(category: "발매일", memoDetail: "2024년 9월 23일")
                    }
                }
                HStack(alignment: .center, spacing: 10) {
                    AsyncImage(url: URL(string: testImgStr)){ image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        memo(category: "가수", memoDetail: "406호 프로젝트")
                        memo(category: "곡", memoDetail: "Colorful")
                        memo(category: "발매일", memoDetail: "2024년 9월 23일")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    func memo(category: String, memoDetail: String) -> some View {
        HStack(alignment: .center) {
            Text(category)
                .frame(width: 80, alignment: .leading)
                .customFont(font: .semiBold)
            
            Text(memoDetail)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                .customFont(fontSize: 14)
        }
    }
}

#Preview {
    LessonDetailView()
}
