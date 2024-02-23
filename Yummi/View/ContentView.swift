//
//  ContentView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text("Show Ingredients")
            }
            .padding(.horizontal)
            
            if isOn {
                IngredientsView(ingredients: Ingredient.ingredients.sorted(by: { $0.expiryDate < $1.expiryDate }))
            } else {
                RecipesView(recipes: Recipe.recipes.sorted(by: { $0.rating < $1.rating }))
            }
        }
    }
}

#Preview {
    ContentView()
}
