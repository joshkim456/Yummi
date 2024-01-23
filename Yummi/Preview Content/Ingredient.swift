//
//  Ingredient.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

enum Category: String {
    case fruitsAndVeg = "Fruits & Veg"
    case meats = "Meats"
    case carbs = "Carbs"
    case drink = "Drink"
    case dairy = "Dairy"
}

enum Units: String {
    case kg = "kg"
    case g = "g"
    case ml = "ml"
    case l = "l"
}

struct Ingredient {
    let name: String
    var quantity: Int
    let unit: Units
    let category: Category
    let expiryDate: Date
    
    func displayInformation() -> String {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy-MM-dd"
        
        let formattedExpiryDate = displayFormatter.string(from: expiryDate)

        
        return (
        """
        Name: \(name)
        Quantity: \(quantity)
        Unit: \(unit.rawValue)
        Category: \(category.rawValue)
        Expiry Date: \(formattedExpiryDate)
        """
        )
    }
}
