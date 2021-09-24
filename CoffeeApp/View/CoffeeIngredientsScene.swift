//
//  CoffeeIngredientsScene.swift
//  CoffeeApp
//
//  Created by Mike on 24/09/2021.
//

import UIKit

class CoffeeIngredientsScene: UIViewController {
    
    var viewModel: CoffeeIngredientViewModel?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel?.coffee?.name
        ingredientsLabel.text = viewModel?.coffee?.ingredients.joined(separator: "\n")
    }
}
