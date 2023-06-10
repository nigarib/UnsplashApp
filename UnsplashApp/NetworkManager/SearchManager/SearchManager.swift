//
//  SearchManager.swift
//  UnsplashApp
//
//  Created by Nigar on 28.05.23.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func getSearchItems(text: String, complete: @escaping ((Search?, String? )->())) {
        let url = NetworkHelper.shared.urlConfig(path: "search/photos") + "&query=\(text)"
        print("url: \(url)")
        NetworkManager.shared.request(model: Search.self,
                                      url: url,
                                      complete: complete)
//        print(NetworkHelper.shared.urlConfig(path: "search/photos") + "&query=\(text)")
    }
}
