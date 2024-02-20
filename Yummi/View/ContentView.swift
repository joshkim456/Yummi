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
        Toggle(isOn: $isOn) {
            if isOn {
                IngredientsView()
            } else {
                RecipesView(recipes: Recipe.recipes)
            }
        }
    }
}

#Preview {
    ContentView()
}
