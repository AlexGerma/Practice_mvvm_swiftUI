//
//  IndexModel.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 01/02/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import Foundation

struct PokemonModel: Decodable {
    let pokemon: [StructPokemon]
    
    struct StructPokemon: Identifiable, Decodable {
        let id = UUID()
        let pokemon: DataPokemon
        let slot: Int
        
        struct DataPokemon: Decodable {
            let name: String
            let url: String
        }
    }
}


//detail pokemon
struct DetailPokemonModel: Identifiable,Decodable {
    let id = UUID()
    let abilities: [StructAbilities]
    let order: Int
    let name: String
    let sprites: StructSprites
    let types: [StructTypes]
    
    //Abilities structure
    struct StructAbilities: Decodable {
        let ability: DataAbility
        let is_hidden: Bool
        let slot: Int
        
        struct DataAbility: Decodable {
            let name: String
            let url: String
        }
    }
    
    //sprites structure
    struct StructSprites: Decodable {
        let back_default: String?
        let front_default: String?
    }
    
    //types structure
    struct StructTypes: Identifiable,Decodable {
        let id = UUID()
        let slot:Int
        let type: DataType
        
        struct DataType: Decodable {
            let name:String
            let url:String
        }
        
        

    }
    
    
    
}
