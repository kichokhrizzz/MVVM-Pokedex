//
//  PokemonViewModel.swift
//  MVVM-Pokedex
//
//  Created by Jhosel Badillo Cortes on 05/06/23.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    
    
    func fetchPokemon(){
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else{return}
                    
                    DispatchQueue.main.async {
                        self.pokemon = pokemon
                    }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> Color{
        switch type{
        case "fire": return .red
        case "posion": return .green
        case "water": return .teal
        case "electric": return .yellow
        case "psychic": return .purple
        case "normal": return .orange
        case "ground": return .gray
        case "flying": return .blue
        case "fairy": return .pink
        default: return .indigo
            
        }
    }
}



extension Data{
    func parseData(removeString string: String)->Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
