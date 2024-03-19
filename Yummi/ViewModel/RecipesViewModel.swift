//
//  RecipesViewModel.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 29/02/2024.
//

import Foundation
import SwiftUI

enum FilterType: String, CaseIterable {
    case byRating, available
}

@Observable
class RecipesViewModel {
    static let shared = RecipesViewModel()
    
    var recipes: [Recipe]
    
    var filterType: FilterType = .byRating
    
    var filteredRecipes: [Recipe] {
        if filterType == .available {
            print("TODO")
        } else {
            return recipes.sorted(by: { $0.rating < $1.rating })
        }
        
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var currentIngredient: Int = 0 {
        didSet {
            if currentIngredient >= recipes[1].ingredientsNeeded.count {
                currentIngredient = 0
            }
        }
    }
    
    let onImage = Image(systemName: "star.fill")
    let offImage = Image(systemName: "star")
    
    var searchText = ""
    
    private init() {
        recipes = Recipe.recipes.sorted(by: { $0.rating < $1.rating })
    }
    
}











