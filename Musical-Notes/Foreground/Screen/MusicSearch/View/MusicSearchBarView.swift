//
//  MusicSearchBarView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/6/24.
//

import SwiftUI

struct MusicSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.35))
                .frame(height: 44)
            
            TextField(text: $searchText) {
                HStack {
                    Text("오늘 연습한 곡을 찾아보세요 :) ")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    MusicSearchBarView(searchText: .constant("검색"))
}
