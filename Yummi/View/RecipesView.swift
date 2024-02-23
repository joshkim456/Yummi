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
    
    let onImage = Image(systemName: "star.fill")
    let offImage = Image(systemName: "star")
    
    var body: some View {
        List {
            ForEach(recipes, id: \.self.id) { recipe in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(recipe.name)")
                            .font(.title)
                            .lineLimit(nil)
                        Text("\(recipe.ingredientsNeeded.count) ingredients needed")
                            .foregroundStyle(Color.gray)
                        HStack {
                            ForEach(1...5, id: \.self) { number in
                                if number > recipe.rating {
                                    offImage
                                } else {
                                    onImage
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .trailing) {
                        if recipe.isFavourite {
                            Image(systemName: "heart.fill")
                        } else {
                            Image(systemName: "heart")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesView(recipes: Recipe.recipes)
}
