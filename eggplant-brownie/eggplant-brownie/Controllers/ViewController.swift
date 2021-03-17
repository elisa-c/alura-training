//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 12/03/21.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    
    var delegate: AddMealsDelegate?
    
    @IBAction func add(_ sender: Any){ // _  hidden parameter

        guard let mealName = nameTextField?.text else {
            return
        }
        
        guard let mealHappiness = happinessTextField?.text, let happiness = Int(mealHappiness) else {
            return
        }
        
        let meal = Meal(name: mealName, happiness: happiness)
    
        delegate?.add(meal)
        
        navigationController?.popViewController(animated: true)
    }
    
}
