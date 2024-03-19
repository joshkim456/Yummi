//
//  InventoryIngredient.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

struct InventoryIngredient: Identifiable {
    
    var ingredient: Ingredient
    var expiryDate: Date
    
    var id: String {
        ingredient.name
    }
    
    func displayInformation() -> String {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy-MM-dd"
        
        let formattedExpiryDate = displayFormatter.string(from: expiryDate)

        
        return "\(ingredient.quantity)\(ingredient.unit) of \(ingredient.name) (\(ingredient.category)) which expires on \(formattedExpiryDate)"
    }
    
    #if DEBUG

    static var inventory = [InventoryIngredient(ingredient: Ingredient(name: "Apple", quantity: 20, unit: .kg, category: .fruitsAndVeg), expiryDate: DateMaker.makeDate(from: "2024-01-01") ?? Date()),
                            InventoryIngredient(ingredient: Ingredient(name: "Banana", quantity: 169, unit: .kg, category: .fruitsAndVeg), expiryDate: DateMaker.makeDate(from: "2025-05-06") ?? Date()),
                            InventoryIngredient(ingredient: Ingredient(name: "Peach", quantity: 420, unit: .kg, category: .fruitsAndVeg), expiryDate: DateMaker.makeDate(from: "2024-02-29") ?? Date()),
                            InventoryIngredient(ingredient: Ingredient(name: "Cow", quantity: 1, unit: .kg, category: .meats), expiryDate: DateMaker.makeDate(from: "2024-08-14") ?? Date())
    ]

    #endif
}

