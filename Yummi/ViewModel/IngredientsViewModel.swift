//
//  IngredientsViewModel.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 29/02/2024.
//

import Foundation

@Observable
class IngredientsViewModel {
    var showingSheet = false
    
    var ingredients: [Ingredient]
    
    var inputName = ""
    var inputQuantity: Int = 0 {
        didSet {
            if inputQuantity < 0 {
                inputQuantity = 0
            }
        }
    }

    var inputExpiryDate = Date()
    
    var selectedCategory: Category = .carbs
    var selectedUnit: Units = .g
    
    func addNewIngredient() {
        let newIngredient = Ingredient(name: inputName, quantity: inputQuantity, unit: Units(rawValue: selectedUnit.rawValue) ?? .invalid, category: Category(rawValue: selectedCategory.rawValue) ?? .invalid, expiryDate: inputExpiryDate)
        ingredients.append(newIngredient)
        ingredients = ingredients.sorted(by: { $0.expiryDate < $1.expiryDate })
        
        inputName = ""
        selectedCategory = .carbs
        inputExpiryDate = Date()
        inputQuantity = 0
        selectedCategory = .carbs
        selectedUnit = .g
    }
    
    init() {
        ingredients = Ingredient.ingredients.sorted(by: { $0.expiryDate < $1.expiryDate })
    }
    
}










