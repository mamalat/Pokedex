//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemonId: String
    
    @State var pokemon: Pokemon?

    var body: some View {
        VStack {
            if let pokemon {
                ScrollView {
                    VStack(spacing: 0) {
                        PokemonCardView(pokemon: pokemon)
                            .frame(height: 500)
                        
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.1))
                            .frame(height: 500)
                            .overlay {
                                Text("Place for details...")
                            }
                    }
                }
            } else {
                Text("Loading pokemon data...")
                    .onAppear {
                        fetchData()
                    }
            }
        }
        .navigationTitle(pokemonId.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func fetchData() {
        APIService.shared.fetchPokemon(pokemonId) { result in
            switch result {
            case .success(let item):
                self.pokemon = item
                print("Pokemon fetched successfully: \(item)")
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemonId: "pikachu")
        .environmentObject(UserSettings())
}
