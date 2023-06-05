//
//  Pokemon.swift
//  MVVM-Pokedex
//
//  Created by Jhosel Badillo Cortes on 05/06/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "bulbasur", imageUrl: "1", type: "poison"),
    .init(id: 1, name: "bulbasur", imageUrl: "1", type: "poison"),
    .init(id: 2, name: "bulbasur", imageUrl: "1", type: "poison"),
]
