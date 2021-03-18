//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 16/03/21.
//


import UIKit

class MealsTableViewController: UITableViewController, AddMealsDelegate {

    var meals: [Meal] = []
    
    override func viewDidLoad() {
        var mealList = MealDao().retrieve()
    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
        MealDao().save(meals)
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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began { // enters the condition only once, after the long press has started. prevents double actions
            
            let cell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else {return}
            let selectedMeal = meals[indexPath.row]
            
//          guard let selectedMealName = cell.textLabel?.text else {return}
            
            RemoveMealViewController(controller: self).show(selectedMeal, handler: {
                alert in
                self.meals.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
        }
    }

    

    
}
