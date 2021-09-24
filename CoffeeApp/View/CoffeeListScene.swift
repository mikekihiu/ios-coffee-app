//
//  CoffeeListScene.swift
//  CoffeeApp
//
//  Created by Mike on 24/09/2021.
//

import UIKit

class CoffeeListScene: UIViewController {
    
    var viewModel: CoffeeListViewModel?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setUpTableView()
    }
    
    private func bindViewModel() {
        viewModel = CoffeeListViewModel()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewModel?.segueIngredientsId,
           let ingredientsScene = segue.destination as? CoffeeIngredientsScene {
            ingredientsScene.viewModel = CoffeeIngredientViewModel(coffee: viewModel?.selectedCoffee)
        }
    }
}


// MARK: UITableView Delegate & DataSource
extension CoffeeListScene: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.coffees?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel?.coffeeCellId ?? "")
        else { return UITableViewCell() }
        cell.textLabel?.text = viewModel?.coffees?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectCoffee(indexPath)
        if let segueId = viewModel?.segueIngredientsId {
            performSegue(withIdentifier: segueId, sender: nil)
        }
    }
}
