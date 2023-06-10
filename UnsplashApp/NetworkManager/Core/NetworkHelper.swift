//
//  NetworkHelper.swift
//  UnsplashApp
//
//  Created by Nigar on 14.05.23.
// https://api.unsplash.com/photos/?client_id=Td9aYZD08bNRh4YCIGC1_B_ho0-cfMXVC9my5S6IKnQ

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.unsplash.com/"
    let apiKey = "Td9aYZD08bNRh4YCIGC1_B_ho0-cfMXVC9my5S6IKnQ"
    
    func urlConfig(path: String) -> String {
        baseUrl + path + "?client_id=\(apiKey)"
    }
    
    func urlConfig2(path1: String, id: String, path2: String) -> String {
        baseUrl + path1 + "\(id)" + path2 + "?client_id=\(apiKey)"
    }
    
//    topics/Mr49Evh5Sks/photos
}
