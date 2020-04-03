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
    private var count: Int = 0
    func setBannerColor( detailPokemon: DetailPokemonModel) -> Color {
        count = 0
        if detailPokemon.types.count >= 2 {
            count = 1
        }
        return Color("\(detailPokemon.types[count].type.name)-color")
       
    }

    func setImageBanner( detailPokemon: DetailPokemonModel) -> Image {
       count = 0
       if detailPokemon.types.count >= 2 {
                  count = 1
        }
        return Image("\(detailPokemon.types[count].type.name)-img")
    }
}



