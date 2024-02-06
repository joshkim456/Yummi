//
//  RecipesView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 06/02/2024.
//

import SwiftUI

struct RecipesView: View {
    var recipes: [Recipe]
    @State var currentIngredient: Int = 0 {
        didSet {
            if currentIngredient >= recipes[1].ingredientsNeeded.count {
                currentIngredient = 0
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(recipes, id: \.self.id) { recipe in
                HStack {
                    Text("\(recipe.name)")
                    Text("Rating: \(recipe.rating)")
                }
            }
        }
    }
}

#Preview {
    RecipesView(recipes: Recipe.recipes)
}
