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
            if isOn {
                IngredientsView(ingredients: Ingredient.ingredients)
            } else {
                RecipesView(recipes: Recipe.recipes)
            }
            Toggle(isOn: $isOn) {
                Text("Show Ingredients")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
