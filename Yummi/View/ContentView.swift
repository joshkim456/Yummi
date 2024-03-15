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
        TabView {
            RecipesView(recipes: Recipe.recipes.sorted(by: { $0.rating < $1.rating }))
                .tabItem {
                    Label("Recipes", systemImage: "list.number")
                }
            
            IngredientsView()
                .tabItem {
                    Label("Ingredients", systemImage: "cube.box")
                }

        }
    }
}

#Preview {
    ContentView()
}
