//
//  LazyNavigationView.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

struct LazyNavigationView<Content: View> : View {
    let closure: () -> Content
    
    init(_ closure: @autoclosure @escaping () -> Content) {
        self.closure = closure
    }
    
    var body: some View {
        closure()
    }
}
