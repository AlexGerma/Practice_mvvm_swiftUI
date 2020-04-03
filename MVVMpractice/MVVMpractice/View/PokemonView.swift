//
//  IndexView.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 01/02/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonView: View {

    @ObservedObject var pokemonVM = PokemonViewModel()
    @ObservedObject var helper = Helpers()
    
    @State var types_pokemons:String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                if !pokemonVM.pokemonData.isEmpty {
                   VStack{
                    ForEach(pokemonVM.pokemonDetail){ item in
                        PokemonCard(id: 1,color: self.helper.setBannerColor(detailPokemon: item), pokemon_name:item.name, pokemon_key: item.order,seccion: "key", pokemon_type: item.types[0].type.name ,imgBanner: self.helper.setImageBanner(detailPokemon: item),imgType:KFImage(URL(string: self.pokemonVM.setImageURL(sprite: item.sprites )!)) ,onClick:{value in
                            print(value)} ).padding(.bottom)
                       }
                   }
                }
            }.navigationBarTitle("Dragon pokemons")
        }
    }
}


struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
