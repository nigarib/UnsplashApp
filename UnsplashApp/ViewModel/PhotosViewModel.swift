//
//  MainViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 14.05.23.
//

import Foundation

class PhotosViewModel {
    var photos = [Photos]()
    var topics = [Topic]()
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getPhotos() {
        PhotosManager.shared.getPhotos { data, error in
            if let error = error {
                print("error: \(error)")
                self.errorCallBack?(error)
            } else if let data = data {
                self.photos = data
                self.successCallBack?()
            }
        }
    }
    
    func getTopics() {
        PhotosManager.shared.getTopics { data, error in
            if let error = error {
                print("error: \(error)")
                self.errorCallBack?(error)
            } else if let data = data {
                self.topics = data
                self.successCallBack?()
            }
        }
    }
    
}

