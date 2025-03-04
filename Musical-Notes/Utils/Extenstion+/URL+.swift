//
//  URL+.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 3/4/25.
//

import Foundation

extension URL {
    var toURLRequest: URLRequest {
        return URLRequest(url: self)
    }
}
