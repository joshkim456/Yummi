//
//  ContentView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let ingredientExamples = Ingredients()
    
    @State var inputName = ""
    @State var inputQuantity = ""
    @State var inputUnit = ""
    @State var inputCategory = ""
    @State var inputExpiryDate = ""
    
    @State private var selectedIngredient: Int = 0 {
        didSet {
            if selectedIngredient >= ingredientExamples.ingredients.count {
                selectedIngredient = 0
            }
        }
    }
    
    @State private var selectedCategory: Category = .carbs
    @State private var selectedUnit: Units = .g

    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    Text(ingredientExamples.ingredients[selectedIngredient].displayInformation())
                    Button("Next ingredient", action: {
                        selectedIngredient += 1
                    })
                }
            }
            Section {
                Text("Enter a new ingredient: ")
                TextField("Name:", text: $inputName)
                TextField("Quantity:", text: $inputQuantity)
                
                VStack {
                    Picker("Category:", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) {
                            category in Text(category.rawValue)
                        }
                    }
                }
                
                VStack {
                    Picker("Unit:", selection: $selectedUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            unit in Text(unit.rawValue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
