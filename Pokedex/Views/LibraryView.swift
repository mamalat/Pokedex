//
//  LibraryView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct LibraryView: View {
    @State private var searchText = ""
    @State private var pokemons: [PokemonWiki.PokemonItem] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                if searchResults.isEmpty {
                    Text("No results...")
                } else {
                    List(searchResults, id: \.name) { pokemon in
                        NavigationLink {
                            PokemonDetailView(pokemonId: pokemon.name)
                        } label: {
                            Text(pokemon.name.capitalized)
                        }
                    }
                }
            }
            .navigationTitle("Library")
        }
        .searchable(text: $searchText)
        .onAppear {
            fetchPokemons()
        }
    }
    
    private var searchResults: [PokemonWiki.PokemonItem] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func fetchPokemons() {
        APIService.shared.fetchPokemonWiki { result in
            guard case .success(let wiki) = result else { return }
            
            pokemons = wiki.pokemons.sorted { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending }
        }
    }
}


#Preview {
    LibraryView()
        .environmentObject(UserSettings())
}
