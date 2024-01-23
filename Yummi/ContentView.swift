//
//  ContentView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let ingredientExamples = Ingredients()
    
    @State private var selectedIngredient: Int = 0 {
        didSet {
            if selectedIngredient >= ingredientExamples.ingredients.count {
                selectedIngredient = 0
            }
        }
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(ingredientExamples.ingredients[selectedIngredient].displayInformation())
                Button("Next ingredient", action: {
                    selectedIngredient += 1
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
