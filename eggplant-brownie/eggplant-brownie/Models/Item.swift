//
//  Item.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 15/03/21.
//

import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var calories: Double

    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calories = coder.decodeDouble(forKey: "calories")
    }
    
        
}
