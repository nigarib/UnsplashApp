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
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("RegisterUsers.json")
        print(path)
        return path
    }
    
    func writeJsonFile() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getFilePath())
            self.backCallBack?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readJsonFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                users = try JSONDecoder().decode([RegisterUser].self, from: data)
            } catch {
                print(error.localizedDescription)

            }
        } else {
            print("File not exist ")
        }
    }
}
