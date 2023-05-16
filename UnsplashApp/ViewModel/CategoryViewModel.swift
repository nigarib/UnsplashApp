//
//  CategoryViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 16.05.23.
//

import Foundation

class CategoryViewModel {
    var categories = [Photos]()
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getCategories() {
        
    }
}
