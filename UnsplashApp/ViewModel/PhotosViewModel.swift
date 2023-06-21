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
    
    func saveItem(index: Int) {
        let item = photos[index]
        let adapter = FileManagerAdapter()
        adapter.readDataFromFile()
        if adapter.isItemFavorite(item) {
            errorCallBack?("This item already added")
            let index = adapter.items.firstIndex(where: { $0.id == item.id })
            adapter.deleteItem(at: index ?? -1)
        } else {
            photos[index].isFavorite = true
            adapter.writeToJsonFile(item: photos[index])
        }
    }
}
