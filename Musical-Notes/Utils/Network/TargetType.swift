//
//  TargetType.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 3/4/25.
//

import Foundation

protocol TargetType {
    var scheme: Scheme { get }
    var host: String { get }
    var path: String { get }
    var parameters: [String: Any] { get }
}
