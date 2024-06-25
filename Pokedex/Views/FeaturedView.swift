//
//  FeaturedView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct FeaturedView: View {
    @State private var viewModel = FeaturedViewModel()
    @State private var runnedOnce = false
    @State private var pokemon: Pokemon?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let pokemon = viewModel.pokemon {
                    NavigationLink {
                        PokemonDetailView(pokemonId: pokemon.name, pokemon: pokemon)
                    } label: {
                        PokemonCardView(pokemon: pokemon)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                } else {
                    Text("Loading Pokemon...")
                }
            }
            .padding(.all, 16)
            .toolbar {
                Button {
                    viewModel.fetchRandomPokemon()
                } label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                }
            }
        }
        .task {
           guard !runnedOnce else { return }

           viewModel.fetchRandomPokemon()

           runnedOnce = true
       }
    }
}

#Preview {
    FeaturedView()
        .environmentObject(UserSettings())
}
