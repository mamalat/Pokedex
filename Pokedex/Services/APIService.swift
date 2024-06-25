//
//  APIService.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import Foundation

class APIService {
    static let shared = APIService()

    func fetchPokemon(_ id: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(pokemon))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func fetchPokemonWiki(completion: @escaping (Result<PokemonWiki, Error>) -> Void) {
        let HARD_CODED_POKEMONS_LIMIT = 1025 // Total items: 1302, total pokemons count: 1025

        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(HARD_CODED_POKEMONS_LIMIT)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let wiki = try JSONDecoder().decode(PokemonWiki.self, from: data)
                completion(.success(wiki))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
