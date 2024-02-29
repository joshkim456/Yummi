//
//  IngredientsView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 20/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @State var ingredientsViewModel: IngredientsViewModel = IngredientsViewModel()
    
    var body: some View {
        Form {
            Section {
                List {
                    
                    ForEach(ingredientsViewModel.ingredients, id: \.self.id) { ingredient in
                        Text(ingredient.displayInformation())
                    }
                    .onDelete { indexSet in
                        ingredientsViewModel.ingredients.remove(atOffsets: indexSet)
                    }
                }
            }
            Section {
                VStack {
                    VStack {
                        Text("Enter a new ingredient: ")
                            .padding()
                        TextField("Name:", text: $ingredientsViewModel.inputName)
                        Spacer()
                        Stepper("Quantity: \(ingredientsViewModel.inputQuantity)", value: $ingredientsViewModel.inputQuantity, in: 0...Int.max)
                        Spacer()
                        DatePicker(
                            "Expiry Date",
                            selection: $ingredientsViewModel.inputExpiryDate,
                            displayedComponents: [.date]
                        )
                        Spacer()
                    }
                    VStack {
                        Picker("Category:", selection: $ingredientsViewModel.selectedCategory) {
                            ForEach(Category.allCases, id: \.self) {
                                category in Text(category.rawValue)
                            }
                        }
                    }
                    
                    VStack {
                        Picker("Unit", selection: $ingredientsViewModel.selectedUnit) {
                            ForEach(Units.allCases, id: \.self) {
                                unit in Text(unit.rawValue)
                            }
                        }
                    }
                }
                
                Button("Enter") {
                    ingredientsViewModel.addNewIngredient()
                }
            }
        }
    }
}

#Preview {
    IngredientsView()
}

