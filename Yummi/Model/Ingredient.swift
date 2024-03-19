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
    
    var id: String {
        name
    }
    
    func displayInformation() -> String {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy-MM-dd"
        
        return "\(quantity)\(unit) of \(name) (\(category))"
    }
}
