//
//  MusicSearchView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

let test =  "https://is1-ssl.mzstatic.com/image/thumb/Music211/v4/c8/3c/3b/c83c3b28-0d78-bc48-5ae5-d523f07ef5d8/888272138375.jpg/150x150bb.jpg"

struct MusicSearchView: View {
    @State private var searchTxt: String = ""
    @State private var isOnSubmitted: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { item in
                    // search 결과로 들어올 것.
                    MusicSearchCompoView(albumImg: test, artistName: "아이유", songTitle: "\(item + 1) for test")
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .searchable(text: $searchTxt)
        .onSubmit(of: .search) {
            print("enter 인식")
        }
    }
}

#Preview {
//    NavigationStack {
//        AddMemoView(viewModel: AddMemoViewModel())
//    }
    NavigationStack {
        MusicSearchView()
    }
}
