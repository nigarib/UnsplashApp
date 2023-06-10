//
//  UserPhotosViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 08.06.23.
//

import Foundation

class UserPhotosViewModel {
    var index: Int
    var photos: [Photos]
    
    init(photos: [Photos], index: Int) {
        self.index = index
        self.photos = photos
    }
}
