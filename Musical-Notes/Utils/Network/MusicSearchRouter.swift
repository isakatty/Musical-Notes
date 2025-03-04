//
//  MusicSearchRouter.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 3/4/25.
//

import Foundation

struct MusicSearchRouter {
    var search: String
    var offset: Int
    
    init(search: String, offset: Int = 0) {
        self.search = search
        self.offset = offset
    }
}

extension MusicSearchRouter: TargetType {
    var scheme: Scheme {
        .https
    }
    
    var host: String {
        "api.music.apple.com"
    }
    
    var path: String {
        "/v1/catalog/kr/search"
    }
    
    var parameters: [String: Any] {
        return [
            "term": search,
            "limit": "25",
            "offset": "\(offset)",
            "types": "songs"
        ]
    }
}

extension MusicSearchRouter: URLConvertible {
    var toURL: URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme.rawValue
        urlComponent.host = host
        urlComponent.path = path
        if !parameters.isEmpty {
            urlComponent.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: $0.value as? String)
            }
        }
        
        return urlComponent.url
    }
}
