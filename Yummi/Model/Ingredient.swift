//
//  Ingredient.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

enum Category: String, CaseIterable {
    case fruitsAndVeg = "Fruits & Veg"
    case meats = "Meats"
    case carbs = "Carbs"
    case drink = "Drink"
    case dairy = "Dairy"
    case invalid = "Invalid Category"
}

enum Units: String, CaseIterable {
    case kg = "kg"
    case g = "g"
    case ml = "ml"
    case l = "l"
    case invalid = "Invalid Unit"
}

struct Ingredient: Identifiable {
    let name: String
    var quantity: Int
    let unit: Units
    let category: Category
    let expiryDate: Date
    
    var id: String {
        name
    }
    
    func displayInformation() -> String {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy-MM-dd"
        
        let formattedExpiryDate = displayFormatter.string(from: expiryDate)

        
        return "\(quantity)\(unit) of \(name) \(category) which expires on \(formattedExpiryDate)"
    }
    
    #if DEBUG

    static var ingredients = [Ingredient(name: "Apple", quantity: 20, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-01-01") ?? Date()),
                       Ingredient(name: "Banana", quantity: 169, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-05-06") ?? Date()),
                       Ingredient(name: "Peach", quantity: 420, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-02-29") ?? Date()),
                       Ingredient(name: "Cow", quantity: 1, unit: .kg, category: .meats, expiryDate: DateMaker.makeDate(from: "2024-08-14") ?? Date())
                       
    ]

    #endif
}
