//
//  IngredientsView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 20/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @State var ingredients: [Ingredient]
    
    @State var inputName = ""
    @State var inputQuantity: Int = 0 {
        didSet {
            if inputQuantity < 0 {
                inputQuantity = 0
            }
        }
    }

    @State var inputExpiryDate = Date()
    
    @State private var selectedCategory: Category = .carbs
    @State private var selectedUnit: Units = .g
        
    var body: some View {
        Form {
            Section {
                List {
                    
                    ForEach(ingredients, id: \.self.id) { ingredient in
                        Text(ingredient.displayInformation())
                    }
                    .onDelete { indexSet in
                        ingredients.remove(atOffsets: indexSet)
                    }
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
                        DatePicker(
                            "Expiry Date",
                            selection: $inputExpiryDate,
                            displayedComponents: [.date]
                        )
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
            }
        }
    }
}

#Preview {
    IngredientsView(ingredients: Ingredient.ingredients)
}

