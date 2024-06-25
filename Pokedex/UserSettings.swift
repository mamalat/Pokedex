//
//  UserSettings.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var bookmarks: [String] = []
    
    init() {
        self.bookmarks = UserDefaults.standard.array(forKey: "bookmarks") as? [String] ?? []
    }

    func toggleBookmark(name: String) {
        if bookmarks.contains(name) {
            bookmarks = bookmarks.filter { $0 != name }
        } else {
            bookmarks.append(name)
        }
        
        print("bookmarks \(bookmarks)")
        UserDefaults.standard.setValue(bookmarks, forKey: "bookmarks")
    }
}
