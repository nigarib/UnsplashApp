//
//  ProfileViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 15.06.23.
//

import Foundation

class ProfileViewModel {
    var items = [Photos]()
    var currentUser: RegisterUser?
    
    private var adapter = FileManagerAdapter()
    let userAdapter = UserRegisterAdapter()
    
    func getUser() {
        userAdapter.readJsonFile()
        currentUser = userAdapter.getcCurrentUser()
    }
    
    func getItems() {
        adapter.readDataFromFile()
        items = adapter.items
    }
    
    func deleteItem(index: Int) {
        adapter.deleteItem(at: index)
        getItems()
    }
    
    func favoriteTap(index: Int) {
        if let favorite = items[index].isFavorite, favorite {
            deleteItem(index: index)
        } else {
            //save to file
        }
    }
    
    func reset () {
        items.removeAll()
    }
}
