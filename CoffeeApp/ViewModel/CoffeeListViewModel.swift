//
//  CoffeeListViewModel.swift
//  CoffeeApp
//
//  Created by Mike on 24/09/2021.
//

import Foundation

struct CoffeeListViewModel {
    
    lazy var coffees = CoffeeRepo.coffees
    
    var selectedCoffee: Coffee?
    
    let segueIngredientsId = "PushCoffeeIngredients"
    let coffeeCellId = "CoffeeCell"
    
    mutating func selectCoffee(_ indexPath: IndexPath) {
        selectedCoffee = coffees?[indexPath.row]
    }
}
