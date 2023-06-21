//
//  RegisterStruct.swift
//  UnsplashApp
//
//  Created by Nigar on 16.05.23.
//

import Foundation

struct RegisterUser: Codable {
    let firstname: String?
    let lastname: String?
    let username: String?
    let email: String?
    let password: String?
    var profileImage: Data?
    
}
