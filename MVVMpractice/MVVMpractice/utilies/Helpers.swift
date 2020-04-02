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
    @Published var image: UIImage?


  func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }

    func setBannerColor( detailPokemon: DetailPokemonModel) -> Color {
        print(detailPokemon.types[0].type.name)
        print(detailPokemon.types.count)
        if detailPokemon.types.count >= 2 {
            return Color("\(detailPokemon.types[1].type.name)-color")
        }
        return Color("\(detailPokemon.types[0].type.name)-color")
    }
    
    func setImageBanner( detailPokemon: DetailPokemonModel) -> Image {
        print(detailPokemon.types[0].type.name)
        print(detailPokemon.types.count)
        if detailPokemon.types.count >= 2 {
            return Image("\(detailPokemon.types[1].type.name)-img")
        }
        return Image("\(detailPokemon.types[0].type.name)-img")
    }
}



