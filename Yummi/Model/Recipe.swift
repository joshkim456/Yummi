//
//  Recipe.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 06/02/2024.
//

import Foundation

struct Recipe: Identifiable {
    var name: String
    var ingredientsNeeded: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    
    var id: String {
        name
    }
    
    #if DEBUG
    static func createRecipe(name: String, ingredientsNeeded: [Ingredient], isFavourite: Bool, rating: Int) -> Recipe {
        let recipe = Recipe(name: name, ingredientsNeeded: ingredientsNeeded, isFavourite: isFavourite, rating: rating)
        
        return recipe
    }
    
    static let recipes = [
        Recipe.createRecipe(name: "Pasta with Tomato Sauce", ingredientsNeeded: [
            Ingredient(name: "Tomato", quantity: 2, unit: .kg, category: .fruitsAndVeg, expiryDate: Date()),
            Ingredient(name: "Pasta", quantity: 1, unit: .kg, category: .carbs, expiryDate: Date()),
            Ingredient(name: "Garlic", quantity: 50, unit: .g, category: .fruitsAndVeg, expiryDate: Date()),
            Ingredient(name: "Olive Oil", quantity: 100, unit: .ml, category: .carbs, expiryDate: Date())
        ], isFavourite: true, rating: 5),
        
        Recipe.createRecipe(name: "Grilled Chicken Salad", ingredientsNeeded: [
            Ingredient(name: "Chicken Breast", quantity: 500, unit: .g, category: .meats, expiryDate: Date()),
            Ingredient(name: "Lettuce", quantity: 10, unit: .g, category: .fruitsAndVeg, expiryDate: Date()),
            Ingredient(name: "Cucumber", quantity: 1, unit: .kg, category: .fruitsAndVeg, expiryDate: Date()),
            Ingredient(name: "Tomato", quantity: 100, unit: .g, category: .fruitsAndVeg, expiryDate: Date())
        ], isFavourite: true, rating: 4),
        
        Recipe.createRecipe(name: "Banana Smoothie", ingredientsNeeded: [
            Ingredient(name: "Banana", quantity: 100, unit: .g, category: .fruitsAndVeg, expiryDate: Date()),
            Ingredient(name: "Milk", quantity: 250, unit: .ml, category: .dairy, expiryDate: Date()),
            Ingredient(name: "Honey", quantity: 20, unit: .ml, category: .carbs, expiryDate: Date())
        ], isFavourite: false, rating: 3)
    ]
    
        
    #endif
}
