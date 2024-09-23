//
//  AsyncImgView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct AsyncImgView: View {
    var imgStr: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imgStr)) { image in
            image
                .resizable()
                .frame(width: width, height: height)
                .scaledToFit()
        } placeholder: {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 60, height: 60)
        }
    }
}
