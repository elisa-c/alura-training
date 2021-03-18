//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 18/03/21.
//

import Foundation

class MealDao {
    
    func save(_ meals: [Meal]) {
        guard let path = retrievePath() else {return}
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func retrievePath() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let path = dir.appendingPathComponent("meal")
        
        return path
    }
    
    func retrieve() -> [Meal] {
        guard let path = retrievePath() else {return [] }
        do {
            let data = try Data(contentsOf: path)
            guard let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> else { return [] }
            return savedMeals
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
