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
    
    @State private var searchText = ""
    
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredRecipes, id: \.self.id) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
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
                                                .font(.caption)
                                        } else {
                                            onImage
                                                .font(.caption)
                                        }
                                    }
                                }
                                .padding(.vertical, 1)
                            }
                            
                            Spacer()
                            
                            
                            VStack(alignment: .trailing) {
                                if recipe.isFavourite {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(Color.red)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    RecipesView(recipes: Recipe.recipes)
}
