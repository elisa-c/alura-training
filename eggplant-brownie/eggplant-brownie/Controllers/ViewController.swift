//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 12/03/21.
//

import UIKit

import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddIngredientsDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    @IBOutlet weak var ingredientsTableView: UITableView?
    
    // Attributes
    
    var delegate: AddMealsDelegate?
    var items: [Item] = [Item(name: "Tomato Sauce", calories: 23),
                         Item(name: "Cheese", calories: 67),
                         Item(name: "Basil", calories: 2),
    ]
    var selectedItems: [Item] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let btnAddItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = btnAddItem
        
        do {
            guard let dir = retrievePath() else {return}
            let data = try Data(contentsOf: dir)
            let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
            items = savedItems
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @objc func addItem(){ // @objc to use objective-c methods such as Selector
        let addIngredientsViewController = AddIngredientsViewController(delegate: self)
        navigationController?.pushViewController(addIngredientsViewController, animated: true)
    }
    
    func add(_ item: Item) {
        items.append(item)
        if let tableView = ingredientsTableView {
            tableView.reloadData()
        } else {
            Alert(controller: self).show(message: "It wasn't possible to update the table")
        }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            guard let path = retrievePath() else {return}
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func retrievePath() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = dir.appendingPathComponent("items")
        
        return path
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        let currIngredient = items[indexPath.row]
        
        if (cell.accessoryType == .checkmark) {
            cell.accessoryType = .none
            if let position = selectedItems.firstIndex(of: currIngredient) {
                selectedItems.remove(at: position)
            }
        } else {
            cell.accessoryType = .checkmark
            selectedItems.append(currIngredient)
        }
        
        print("---")
        
        for item in selectedItems {
            print (item.name)
        }
        
    }
    
    func retrieveMealFromForm() -> Meal? {
        guard let mealName = nameTextField?.text else {
            //            Alert(controller: self).show(message: "Please input a name for the meal")
            return nil
        }
        
        guard let mealHappiness = happinessTextField?.text, let happiness = Int(mealHappiness) else {
            //            Alert(controller: self).show(message: "Happiness must be a number between 1 and 5")
            return nil
        }
        
        let meal = Meal(name: mealName, happiness: happiness, items: selectedItems )
        
        return meal
    }
    
    // MARK: - IBActions
    
    @IBAction func add(_ sender: Any){ // _  hidden parameter
        
        if let meal = retrieveMealFromForm() {
            delegate?.add(meal: meal)
            navigationController?.popViewController(animated: true)
        } else {
            Alert(controller: self).show(message: "Error in reading form data")
        }
        
        
    }
    
}
