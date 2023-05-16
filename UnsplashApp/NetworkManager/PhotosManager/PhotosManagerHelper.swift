//
//  PhotosManagerHelper.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import Foundation

enum PhotosEndPoint: String {
    case photos = "photos/"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
