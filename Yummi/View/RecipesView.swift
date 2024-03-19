//
//  RecipesView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 06/02/2024.
//

import SwiftUI

struct RecipesView: View {
    @State var recipesViewModel: RecipesViewModel = RecipesViewModel.shared
    
    var body: some View {
        NavigationStack {
            List {
                Picker("Filter:", selection: $recipesViewModel.filterType) {
                    Text("By Rating").tag(FilterType.byRating)
                    Text("By Availability").tag(FilterType.available)
                }
                ForEach(recipesViewModel.filteredRecipes, id: \.self.id) { recipe in
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
                                            recipesViewModel.offImage
                                                .font(.caption)
                                        } else {
                                            recipesViewModel.onImage
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
        .searchable(text: $recipesViewModel.searchText)
    }
}

#Preview {
    RecipesView(recipesViewModel: RecipesViewModel.shared)
}
