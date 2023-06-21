//
//  RegisterViewModel.swift
//  UnsplashApp
//
//  Created by Nigar on 16.05.23.
//

import Foundation

class RegisterViewModel {
    static let shared = RegisterViewModel()
    var users = [RegisterUser]()
    var backCallBack: (()->())?
    
    private var adapter = UserRegisterAdapter()
    
    func getItems() {
        adapter.readJsonFile()
        users = adapter.users
    }
    
    func saveUser(data: RegisterUser) {
        adapter.users.append(data)
        adapter.writeJsonFile()
    }
    
    func validateLogin(email: String, password: String) -> Bool {
        users.contains { $0.email == email && $0.password == password }
    }
    
    func getProfile(email: String) -> RegisterUser? {
        users.first { $0.email == email }
    }
}
