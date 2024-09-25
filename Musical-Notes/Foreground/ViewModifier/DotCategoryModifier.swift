//
//  DotCategoryModifier.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/25/24.
//

import SwiftUI

private struct DotCategoryModifier: ViewModifier {
    let category: String
    
    func body(content: Content) -> some View {
        HStack {
            Circle()
                .frame(width: 5, height: 5)
            
            Text(category)
                .customFont()
            
            content
        }
    }
}

extension View {
    func makeCategoryView(_ category: String) -> some View {
        modifier(DotCategoryModifier(category: category))
    }
}
