import UIKit

//let name = "churros"
//let happiness: Int = 5
//let calories: Double = 120.2
//let booleanTest: Bool = true

//func foodEaten(){
//    print("food eaten was \(name)")
//}
//
//func methodWParameters(name: String){
//    print("w parameters")
//}

//methodWParameters(name: name)

let numbers = [50.0, 100]

func numbersFunc(numbers: Array<Double>) -> Double { // indicates the return type
    var total:Double  = 0
    // must be explicit, or else it's read as int and is therefore unable to be added to the double numb
    for numb in numbers {
        total += numb
    }
    return total // must add a return type
}

print(numbersFunc(numbers: numbers))

/* -------------------------------------------- */

class Meal {
    var name: String? // optionals
    var happiness: String?
}

/* -------------------------------------------- */

let meal = Meal()

meal.name = "cake"

print(meal.name) // prints Optional("cake")
print(meal.name! + " - forced unwrap") // prints cake. forced unwrap; not advisable

func showMealNameIfNotNil(){
    // alternative for safe(ish) unwrapping
    if meal.name != nil {
        print(meal.name! + " - if not nil")
    }
}

showMealNameIfNotNil()

func showMealNameOptVar(){
    //optional variable; it's only created if meal.name exists. better than the previous option
    if let name = meal.name {
        print(name + " - opt var") // not necessary to unwrap; the meal constant is already the extracted value
    }
}

showMealNameOptVar()

func showMealNameLetGuard(){
    // recommended
    guard let name = meal.name else {
        // error message etc
        return
    }
    
    print(name + " - let guard")
}

showMealNameLetGuard()

/* -------------------------------------------- */

let num = Int("not a number")
// print(num) error
let num2 = Int("5")
print(num2!)

func printNum() {
    guard let n = num2 else {
        return
    }
    print(n)
}

/* -------------------------------------------- */

class MealWConstructor {
    // attributes
    var name: String
    var happiness: String
    var items: Array<Item> = []
    
    // constructor
    init(name: String, happiness: String) {
        self.name = name
        self.happiness = happiness
    }
    
    //methods
    func caloriesTotal() -> Double {
        var total = 0.0
        for item in mealLunch.items {
            total += item.calories
        }
        return total
    }
}

/* -------------------------------------------- */

let meal2 = MealWConstructor(name: "ice cream", happiness: "5")

print (meal2.name) // doesnt come back wrapped in Optional ()

/* -------------------------------------------- */

class Item {
    var name: String
    var calories: Double

    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let rice = Item(name: "rice", calories: 51.0)
let beans = Item(name: "beans", calories: 90.0)
let broccoli = Item(name: "brocolli", calories: 32.0)

let mealLunch = MealWConstructor(name:"lunch", happiness: "5")

mealLunch.items.append(rice)
mealLunch.items.append(beans)
mealLunch.items.append(broccoli)

print(mealLunch.name)

if let firstItem = mealLunch.items.first{
    print(firstItem.name)
}

print(mealLunch.caloriesTotal())
