//
//  ContentView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userSettings = UserSettings()
    
    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "house")
                }
                
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "book")
                }
            
            BookmarkedView()
                .tabItem {
                    Label("Bookmarked", systemImage: "bookmark")
                }
        }
        .environmentObject(userSettings)
    }
}


#Preview {
    ContentView()
}
