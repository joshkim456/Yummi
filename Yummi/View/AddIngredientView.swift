//
//  AddIngredient.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 15/03/2024.
//

import Foundation

import SwiftUI

struct AddIngredientView: View {
    
    @Bindable var ingredientsViewModel: IngredientsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TextField("Name:", text: $ingredientsViewModel.inputName)
                Stepper("Quantity: \(ingredientsViewModel.inputQuantity)", value: $ingredientsViewModel.inputQuantity, in: 0...Int.max)
            }.padding(.vertical, 10)
            
            DatePicker(
                "Expiry Date",
                selection: $ingredientsViewModel.inputExpiryDate,
                displayedComponents: [.date]
            )
            
            Picker("Category:", selection: $ingredientsViewModel.selectedCategory) {
                ForEach(Category.allCases, id: \.self) {
                    category in Text(category.rawValue)
                }
            }

            Picker("Unit", selection: $ingredientsViewModel.selectedUnit) {
                ForEach(Units.allCases, id: \.self) {
                    unit in Text(unit.rawValue)
                }
            }

        }
        
        Button("Enter") {
            ingredientsViewModel.showingSheet.toggle()
            ingredientsViewModel.addNewIngredient()
        }
    }
}

#Preview {
    Form {
        AddIngredientView(ingredientsViewModel: IngredientsViewModel())
    }
}

