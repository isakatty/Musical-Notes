//
//  MusicInfoDetailView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/23/24.
//

import SwiftUI

struct MusicInfoDetailView: View {
    let category: String
    let memoDetail: String
    
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .frame(width: 5, height: 5)
            Text(category)
                .frame(width: 80, alignment: .leading)
                .customFont(font: .semiBold)
            
            Text(memoDetail)
                .frame(maxWidth: .infinity, alignment: .leading)
                .customFont()
        }
    }
}
