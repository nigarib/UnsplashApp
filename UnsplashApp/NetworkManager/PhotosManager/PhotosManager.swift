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
    
    func getTopics(complete: @escaping(([Topic]?, String? )->())) {
        NetworkManager.shared.request(model: [Topic].self, url: PhotosEndPoint.topics.path, complete: complete)
    }
    
    func getTopicPhotos(id: String, complete: @escaping(([Photos]?, String? )->())) {
        NetworkManager.shared.request(model: [Photos].self,
                                      url: NetworkHelper.shared.urlConfig2(path1: "topics/", id: id, path2: "/photos"), complete: complete)
//        topics/Mr49Evh5Sks/photos
//        print(NetworkHelper.shared.urlConfig2(path1: "topics/", id: id, path2: "/photos"))
    }
    
    
}
