//
//  Item.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 15/03/21.
//

import UIKit

class Item: NSObject {
        var name: String
        var calories: Double

        init(name:String, calories:Double) {
            self.name = name
            self.calories = calories
    }
}
