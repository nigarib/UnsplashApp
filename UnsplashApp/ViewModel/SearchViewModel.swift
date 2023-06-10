//
//  SearchViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 28.05.23.
//

import Foundation

class SearchViewModel {
    
    var searchResult = [Photos]()
    var topics = [Topic]()
    var successCallBack: (()->())?
    var item : Search?
    //    var id: Int?
    
    func getPhotos() {
        PhotosManager.shared.getPhotos { data, error in
            if let error = error {
                print("error: \(error)")
//                self.errorCallBack?(error)
            } else if let data = data {
                self.searchResult = data
                self.successCallBack?()
            }
        }
    }
    
    func getSearchMovies(text: String) {
        SearchManager.shared.getSearchItems(text: text, complete: { data, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                self.searchResult = data.results ?? []
                self.successCallBack?()
            }
        })
    }
    
    func getTopics() {
        PhotosManager.shared.getTopics { data, error in
            if let error = error {
                print("error: \(error)")
//                self.errorCallBack?(error)
            } else if let data = data {
                self.topics = data
                self.successCallBack?()
            }
        }
    }
    
//    func resetAll() {
//        item = nil
//        searchResult.removeAll()
//    }
}
