//
//  FileManagerAdapter.swift
//  UnsplashApp
//
//  Created by Nigar on 15.06.23.
//

import Foundation

class FileManagerAdapter {
    
    var items = [Photos]()
       
    func isItemFavorite(_ item: Photos) -> Bool {
        return items.contains(where: { $0.id == item.id })
    }


    func deleteItem(at index: Int) {
        guard index >= 0, index < items.count else {
            print("Invalid index")
            return
        }

        items.remove(at: index)
        saveDataToFile()
    }
   
    func saveDataToFile() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getFilePath(), options: .atomic)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func writeToJsonFile(item: Photos) {
        readDataFromFile()
        items.append(item)
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                items = try JSONDecoder().decode([Photos].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found ")
        }
    }
    
    func getFilePath() -> URL {
        let paths        = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path         = docDirectory.appendingPathComponent("Favorit.json")
        print("path: \(path)")
        return path
    }
    

}
