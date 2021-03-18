//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 15/03/21.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: - Attributes
    let name: String
    let happiness: Int
    var items: Array<Item> = []
    
    // MARK: - Constructor
    init(name: String, happiness: Int, items: [Item] = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(items, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        happiness = aDecoder.decodeInteger(forKey: "happiness")
        items = aDecoder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    //methods
    func caloriesTotal() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness) \n Ingredients:"
        
        for item in items {
            message += " \n \(item.name) - \(item.calories) calories"
        }
        
        return message
    }
}
