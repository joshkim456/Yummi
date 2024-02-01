//
//  ContentView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var ingredientExamples = Ingredients()
    
    @State var inputName = ""
    @State var inputQuantity: Int = 0 {
        didSet {
            if inputQuantity < 0 {
                inputQuantity = 0
            }
        }
    }
    @State var inputUnit = ""
    @State var inputCategory = ""
    @State var inputExpiryDate = ""
    
    @State private var selectedIngredient: Int = 0
    
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
                VStack {
                    VStack {
                        Text("Enter a new ingredient: ")
                            .padding()
                        TextField("Name:", text: $inputName)
                        Spacer()
                        Stepper("Quantity: \(inputQuantity)", value: $inputQuantity, in: 0...Int.max)
                        Spacer()
                        TextField("Expiry date (yyyy/mm/dd):", text: $inputExpiryDate)
                        Spacer()
                    }
                    VStack {
                        Picker("Category:", selection: $selectedCategory) {
                            ForEach(Category.allCases, id: \.self) {
                                category in Text(category.rawValue)
                            }
                        }
                    }
                    
                    VStack {
                        Picker("Unit", selection: $selectedUnit) {
                            ForEach(Units.allCases, id: \.self) {
                                unit in Text(unit.rawValue)
                            }
                        }
                    }
                }
                
                Button("Enter:") {
                    let newIngredient = Ingredient(name: inputName, quantity: inputQuantity, unit: Units(rawValue: inputUnit) ?? .invalid, category: Category(rawValue: inputCategory) ?? .invalid, expiryDate: DateMaker.makeDate(from: inputExpiryDate) ?? Date())
                    ingredientExamples.ingredients.append(newIngredient)
                    
                    inputUnit = ""
                    inputCategory = ""
                    inputExpiryDate = ""
                    selectedIngredient = 0
                    selectedCategory = .carbs
                    selectedUnit = .g
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
