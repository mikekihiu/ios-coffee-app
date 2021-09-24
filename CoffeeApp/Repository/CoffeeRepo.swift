//
//  CoffeeRepo.swift
//  CoffeeApp
//
//  Created by Mike on 24/09/2021.
//

import Foundation

struct CoffeeRepo {
    
    static var coffees: [Coffee]? {
        guard let url = Bundle.main.url(forResource: "coffees", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode([Coffee].self, from: data)
    }
}

struct Coffee: Decodable {
    let name: String
    let ingredients: [String]
}
