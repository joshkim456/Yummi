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
            RecipesView(recipesViewModel: RecipesViewModel.shared)
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
