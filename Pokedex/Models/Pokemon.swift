//
//  Pokemon.swift
//  Pokedex
//
//  Created by Iaroslav Mamalat.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case sprites
        
        enum SpritesKeys: String, CodingKey {
            case other
            
            enum OtherKeys: String, CodingKey {
                case officialArtwork = "official-artwork"
                
                enum OfficialArtworkKeys: String, CodingKey {
                    case frontDefault = "front_default"
                }
            }
        }
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)

        let spritesContainer = try container.nestedContainer(keyedBy: CodingKeys.SpritesKeys.self, forKey: .sprites)
        let otherContainer = try spritesContainer.nestedContainer(keyedBy: CodingKeys.SpritesKeys.OtherKeys.self, forKey: .other)
        let officialArtworkContainer = try otherContainer.nestedContainer(keyedBy: CodingKeys.SpritesKeys.OtherKeys.OfficialArtworkKeys.self, forKey: .officialArtwork)
        image = try officialArtworkContainer.decode(String.self, forKey: .frontDefault)
    }
    
    init(name: String, id: Int, image: String?) {
        self.name = name
        self.id = id
        self.image = image
    }

}
