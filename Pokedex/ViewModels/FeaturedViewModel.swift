//
//  FeaturedViewModel.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import Foundation

@Observable
class FeaturedViewModel {
    var pokemon: Pokemon?
    
    func fetchRandomPokemon() {
        // TODO: Cache wiki result for future use
        // TODO: Await/Async
        
        print("Fetching wiki")
        APIService.shared.fetchPokemonWiki { result in
            guard
                case .success(let wiki) = result,
                let randomPokemon = wiki.pokemons.randomElement()
            else { return }
            
            print("Randomly selected \(randomPokemon.name): \(randomPokemon.url)")
        
            APIService.shared.fetchPokemon(randomPokemon.name) { [weak self] result in
                switch result {
                case .success(let item):
                    self?.pokemon = item
                case .failure(let error):
                    print("Error fetching users: \(error.localizedDescription)")
                }
            }
            
        }
    }
}
