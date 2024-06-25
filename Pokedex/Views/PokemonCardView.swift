//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import SwiftUI

struct PokemonCardView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    let pokemon: Pokemon
    
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .overlay {
                VStack {
                    HStack {
                        BookmarkView(isBookmarked: userSettings.bookmarks.contains(pokemon.name))
                            .onTapGesture {
                                userSettings.toggleBookmark(name: pokemon.name)
                            }
                        
                        Spacer()
                        
                        // Use description to remove space in cases of > 1000
                        Text("#\(pokemon.id.description)")
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    
                    Spacer()

                    
                    AsyncImage(url: URL(string: pokemon.image ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .id(pokemon.name)
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(5)
                    }
                    .contentTransition(.interpolate)
                    .frame(maxHeight: 400)
                    
                    Spacer()
                    
                    Text(pokemon.name.capitalized)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
                .padding(24)
            }
        
    }
}


#Preview {
    let testPokemon = Pokemon(
        name: "ribombee",
        id: 743,
        image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/743.png"
    )
    
    return PokemonCardView(pokemon: testPokemon).environmentObject(UserSettings())
}
