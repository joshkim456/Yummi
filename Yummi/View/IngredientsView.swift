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
                Button("Add Ingredient") {
                    ingredientsViewModel.showingSheet.toggle()
                }
                .sheet(isPresented: $ingredientsViewModel.showingSheet) {
                    Form {
                        AddIngredientView(ingredientsViewModel: ingredientsViewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    IngredientsView()
}

