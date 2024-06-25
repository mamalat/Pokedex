//
//  PokemonWiki.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import Foundation

struct PokemonWiki: Decodable {
    let count: Int
    let pokemons: [PokemonItem]
    
    struct PokemonItem: Decodable {
        let name: String
        let url: String
    }
    
    enum CodingKeys: String, CodingKey {
        case count
        case pokemons = "results"
    }
}
