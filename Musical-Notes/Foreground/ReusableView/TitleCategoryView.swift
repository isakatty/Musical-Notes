//
//  TitleCategoryView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 10/3/24.
//

import SwiftUI

struct TitleCategoryView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .customFont(font: .light, fontSize: 14)
            Text(content)
                .customFont()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 200, maxHeight: 60)
    }
}
