//
//  IndexViewModel.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 01/02/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case failure
    case error
    case success
}

class PokemonViewModel: ObservableObject {
    @Published var pokemonData: [PokemonModel.StructPokemon] = []
    @Published var pokemonDetail: [DetailPokemonModel] = []
    @Published var dataFlag: Bool = false
    private var _URL:String = ""
 
    init() {
        self.getPokemons(type: "16")
    }
    
    func fetchData(urls: String, callback: @escaping (_ data:Data? ,_ error: RequestError) -> Void) {
        guard let url = URL(string: urls) else { return }
              //AF as reference Alamofire
           AF.request(url, method: .get).validate(statusCode:200..<300).response{  res in
                      switch res.result {
                         case .success:
                          guard let data  = res.data else { return }
                          callback(data,RequestError.success)
                         case .failure:
                           callback(nil,RequestError.failure)
                         }
                  }
    }
    

    func getPokemons(type: String) {
        _URL = "https://pokeapi.co/api/v2/type/\(type)/"
        self.fetchData(urls: _URL){ data, error in
            let result = try! JSONDecoder().decode(PokemonModel.self, from: data!)
            for item in result.pokemon {
                self.getDetail(typePokemon: item)
            }
        }
    }
    
    func getDetail(typePokemon: PokemonModel.StructPokemon){
        self.fetchData(urls: typePokemon.pokemon.url){ data, error in
            let result = try! JSONDecoder().decode(DetailPokemonModel.self, from: data!)
            DispatchQueue.main.async{
                self.pokemonDetail.append(result)
                self.pokemonData.append(typePokemon)
            }
            
        }
    }
    
    func setImageURL(sprite : DetailPokemonModel.StructSprites) -> String? {
        if sprite.front_default != nil { return sprite.front_default }
        if sprite.back_default != nil { return sprite.back_default }
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png"
    }
    
}

