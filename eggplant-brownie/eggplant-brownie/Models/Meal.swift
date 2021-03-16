//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 15/03/21.
//

import UIKit

class Meal: NSObject {
    
    // attributes
    let name: String
    let happiness: Int
    let items: Array<Item> = []
    
    // constructor
    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
    }
    
    //methods
    func caloriesTotal() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
}
