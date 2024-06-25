//
//  BookmarkedView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct BookmarkedView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        NavigationStack {
            
            VStack {
                if userSettings.bookmarks.isEmpty {
                    VStack {
                        Text("Bookmark pokemons to add them to this list.")
                            .frame(maxWidth: 180)
                            .multilineTextAlignment(.center)
                        BookmarkView(isBookmarked: true).allowsHitTesting(false)
                    }
                } else {
                    List(userSettings.bookmarks, id: \.self) { pokemonName in
                        NavigationLink {
                            PokemonDetailView(pokemonId: pokemonName)
                        } label: {
                            Text(pokemonName.capitalized)
                        }
                    }.navigationTitle("Bookmarked")
                    
                }
            }
        }
    }
}

#Preview {
    BookmarkedView()
        .environmentObject(UserSettings())
}
