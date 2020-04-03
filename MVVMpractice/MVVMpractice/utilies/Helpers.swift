//
//  Helpers.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 01/02/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class Helpers: ObservableObject {

    func setBannerColor( detailPokemon: DetailPokemonModel) -> Color {
        if detailPokemon.types.count >= 2 {
            return Color("\(detailPokemon.types[1].type.name)-color")
        }
        return Color("\(detailPokemon.types[0].type.name)-color")
    }
    
    func setImageBanner( detailPokemon: DetailPokemonModel) -> Image {
        if detailPokemon.types.count >= 2 {
            return Image("\(detailPokemon.types[1].type.name)-img")
        }
        return Image("\(detailPokemon.types[0].type.name)-img")
    }
}



