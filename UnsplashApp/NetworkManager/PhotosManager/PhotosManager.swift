//
//  PhotosManager.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import Foundation

class PhotosManager {
    static let shared = PhotosManager()
    
    func getPhotos(complete: @escaping(([Photos]?, String? )->())) {
        NetworkManager.shared.request(model: [Photos].self, url: PhotosEndPoint.photos.path, complete: complete)
    }
}
