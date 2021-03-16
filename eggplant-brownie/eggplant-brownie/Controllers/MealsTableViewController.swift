//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 16/03/21.
//

import Foundation

import UIKit

class MealsTableViewController: UITableViewController {
    let meals = [Meal(name: "noodles", happiness: 4),
                 Meal(name: "pizza", happiness: 4),
                 Meal(name: "temaki", happiness: 4),
                 Meal(name: "cookies", happiness: 4)]
    
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
