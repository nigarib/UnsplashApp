//
//  UserAdapter.swift
//  UnsplashApp
//
//  Created by Nigar on 17.06.23.
//

import Foundation

class UserRegisterAdapter {
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
    
    func savePhotoImage(data: Data?) {
        readJsonFile()
        let email = UserDefaults.standard.string(forKey: "loggedInName")
        let index = users.firstIndex(where: { $0.email == email }) ?? -1
        users[index].profileImage = data
        writeJsonFile()
    }
    
    func getcCurrentUser() -> RegisterUser? {
        let user = users.filter({ $0.email == UserDefaults.standard.string(forKey: "loggedInName") })
        return user.first
    }
}
