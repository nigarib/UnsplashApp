//
//  TopicPhotosViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 06.06.23.
//

import Foundation

class TopicPhotosViewModel {
    var id = ""
    var topicPhotos = [Photos]()
    var successCallBack: (()->())?

    func getTopicPhotos()  {
        PhotosManager.shared.getTopicPhotos(id: id) { data, error in
            if let error = error {
                print("error: \(error)")
            } else if let data = data {
                self.topicPhotos = data
                self.successCallBack?()
            }
        }
    }
}
