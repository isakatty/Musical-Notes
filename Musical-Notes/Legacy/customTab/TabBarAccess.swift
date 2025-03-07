//
//  TabBarAccess.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI
import UIKit

struct TabBarAccessor: UIViewControllerRepresentable {
    
    var callback : (UITabBar) -> Void
    
    private let proxyController = ProxyViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) -> UIViewController {
        
        proxyController.callback = callback
        return proxyController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBarAccessor>) {
    }
    
    // 탭바를 가져오기 위한 헬퍼 뷰컨
    private class ProxyViewController : UIViewController {
        
        var callback : (UITabBar) -> Void = { _ in }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let tabBarController = self.tabBarController {
                // 탭바컨트롤러의 탭바를 클로져로 보낸다.
                callback(tabBarController.tabBar)
            }
        }
    }
}

extension View {
    func setTabBarVisibility(isHidden : Bool) -> some View {
        background(TabBarAccessor(callback: { tabBar in
            print("TabBar 높이: \(tabBar.bounds.height)")
            tabBar.isHidden = true
        }))
    }
}
