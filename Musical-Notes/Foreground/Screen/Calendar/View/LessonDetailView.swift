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
    @State private var time: Double = 40
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 12) {
                Text("2024년 09월 21일(토)")
                    .customFont(font: .medium, fontSize: 16)
                    .foregroundStyle(Color(uiColor: UIColor.darkGray).opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: view2 - 시간
                LessonTimeView(startTime: "12:17 A.M.", endTime: "13:47 A.M.")
                .padding(.vertical)
                
                LessonTimeCircleView(total: 60, progress: time)
                
                Text("오늘 레슨 메모")
                    .customFont(font: .bold, fontSize: 17)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LessonMemoView(memo: "어쩌구 저쩌구 이런 저런 로렘픽섬alskdjfpoqwieflaksdjfl;aksdjflkasjdflkasdalksdjf kasjdfaskdjflaskdj \n 민어래댜미ㅏ얼 \n 최고티비 \n 커스텀 TextEditor를 만들어야 할 듯 ? \n Dynamic height을 갖는.. TextEditor \n 늘어나면 \n 늘어나야함.")
                
                Text("오늘 레슨 곡")
                    .customFont(font: .bold, fontSize: 17)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LessonMusicView(imgStr: testImgStr, width: 80, height: 80, artist: "406호 프로젝트", songTitle: "Colorful", releaseDate: "2024년 09월 23일")
                LessonMusicView(imgStr: testImgStr, width: 80, height: 80, artist: "406호 프로젝트", songTitle: "Colorful", releaseDate: "2024년 09월 23일")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LessonDetailView()
}
