//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 16/03/21.
//


import UIKit

class MealsTableViewController: UITableViewController, AddMealsDelegate {

    var meals = [Meal(name: "noodles", happiness: 4),
                 Meal(name: "pizza", happiness: 4),
                 Meal(name: "temaki", happiness: 4),
                 Meal(name: "cookies", happiness: 4)]
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "add" {
            let view = segue.destination as! ViewController
                view.delegate = self
        }
     
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currMeal = meals[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = currMeal.name
        
        return cell
    }
    

    

    
}
