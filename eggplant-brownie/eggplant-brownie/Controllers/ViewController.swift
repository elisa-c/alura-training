//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 12/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    // IBOutlets
        
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    
    // Attributes
    
    var delegate: AddMealsDelegate?
    var items = ["tomato sauce", "cheese", "basil"]
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item
        
        return cell
    }
    
    // IBAction
    
    @IBAction func add(_ sender: Any){ // _  hidden parameter

        guard let mealName = nameTextField?.text else {
            return
        }
        
        guard let mealHappiness = happinessTextField?.text, let happiness = Int(mealHappiness) else {
            return
        }
        
        let meal = Meal(name: mealName, happiness: happiness)
    
        delegate?.add(meal: meal)
        
        navigationController?.popViewController(animated: true)
    }
    
}
