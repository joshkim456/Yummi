//
//  RecipeDetailView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 27/02/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Image(recipe.imageFilePath)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                Divider()
                HStack() {
                    Text("Rating: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    ForEach(1...5, id: \.self) { number in
                        if number > recipe.rating {
                            Image(systemName: "star")
                            
                                .font(.caption)
                        } else {
                            Image(systemName: "star.fill")
                                .font(.caption)
                        }
                    }
                    .foregroundStyle(Color.yellow)
                }
                .padding(.vertical)
                Divider()
                Text("Ingredients:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                ForEach(recipe.ingredientsNeeded, id: \.self.name) { ingredient in
                    Text("\(ingredient.displayInformation())")
                        .lineLimit(nil)
                }
                .padding(.vertical, 2)
                Divider()
                
                ForEach(recipe.steps, id: \.self) { step in
                    Text("\(step)")
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe.recipes[0])
}
