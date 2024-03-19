//
//  Recipe.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 06/02/2024.
//

import Foundation

struct Recipe: Identifiable {
    var name: String
    var ingredientsNeeded: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    var steps: [String]
    let imageFilePath: String
    
    var id: String {
        name
    }
    
    #if DEBUG
    static func createRecipe(name: String, ingredientsNeeded: [Ingredient], isFavourite: Bool, rating: Int, steps: [String], imageFilePath: String) -> Recipe {
        let recipe = Recipe(name: name, ingredientsNeeded: ingredientsNeeded, isFavourite: isFavourite, rating: rating, steps: steps, imageFilePath: imageFilePath)
        
        return recipe
    }
    
    static let recipes = [
        Recipe.createRecipe(name: "Pasta with Tomato Sauce", ingredientsNeeded: [
            Ingredient(name: "Tomato", quantity: 2, unit: .kg, category: .fruitsAndVeg),
            Ingredient(name: "Pasta", quantity: 1, unit: .kg, category: .carbs),
            Ingredient(name: "Garlic", quantity: 50, unit: .g, category: .fruitsAndVeg),
            Ingredient(name: "Olive Oil", quantity: 100, unit: .ml, category: .carbs)
        ], isFavourite: true, rating: 5, steps: [
            "Bring a large pot of salted water to a boil.",
            "While waiting for the water to boil, wash and chop the tomatoes into small pieces.",
            "Peel and mince the garlic cloves.",
            "Heat the olive oil in a large skillet over medium heat.",
            "Add the minced garlic to the skillet and sauté until golden brown and fragrant.",
            "Carefully add the chopped tomatoes to the skillet, stirring occasionally.",
            "Let the tomatoes cook down until they are soft and the sauce thickens, about 15-20 minutes.",
            "Once the water is boiling, add the pasta to the pot and cook according to package instructions until al dente.",
            "Once the pasta is cooked, drain it and add it to the skillet with the tomato sauce.",
            "Toss the pasta and sauce together until well combined and heated through.",
            "Season with salt and pepper to taste.",
            "Serve the pasta with tomato sauce hot, garnished with fresh basil leaves or grated cheese if desired.",
            "Enjoy your delicious pasta with homemade tomato sauce!"
        ], imageFilePath: "pastaWithTomatoSauce"),
        
        Recipe.createRecipe(name: "Grilled Chicken Salad", ingredientsNeeded: [
            Ingredient(name: "Chicken Breast", quantity: 500, unit: .g, category: .meats),
            Ingredient(name: "Lettuce", quantity: 10, unit: .g, category: .fruitsAndVeg),
            Ingredient(name: "Cucumber", quantity: 1, unit: .kg, category: .fruitsAndVeg),
            Ingredient(name: "Tomato", quantity: 100, unit: .g, category: .fruitsAndVeg)
        ], isFavourite: true, rating: 4, steps: [
            "Preheat your grill to medium-high heat.",
            "Season the chicken breast with salt, pepper, and any other desired seasonings.",
            "Place the chicken breast on the preheated grill and cook for about 6-7 minutes per side, or until fully cooked through and grill marks appear.",
            "While the chicken is grilling, wash and chop the lettuce into bite-sized pieces.",
            "Peel and slice the cucumber into thin rounds.",
            "Wash the tomato and chop it into small chunks.",
            "Once the chicken is cooked, remove it from the grill and let it rest for a few minutes before slicing it into strips.",
            "In a large salad bowl, combine the chopped lettuce, cucumber slices, and tomato chunks.",
            "Add the sliced grilled chicken on top of the salad.",
            "Drizzle your favorite dressing over the salad, or serve it on the side.",
            "Toss the salad gently to combine all the ingredients and coat them evenly with the dressing.",
            "Serve the grilled chicken salad immediately, garnished with fresh herbs or grated cheese if desired.",
            "Enjoy your delicious and nutritious Grilled Chicken Salad!"
        ], imageFilePath: "grilledChickenSalad"),
        
        Recipe.createRecipe(name: "Banana Smoothie", ingredientsNeeded: [
            Ingredient(name: "Banana", quantity: 100, unit: .g, category: .fruitsAndVeg),
            Ingredient(name: "Milk", quantity: 250, unit: .ml, category: .dairy),
            Ingredient(name: "Honey", quantity: 20, unit: .ml, category: .carbs)
        ], isFavourite: false, rating: 3, steps: [
            "Peel the banana and cut it into small pieces.",
            "Pour the milk into a blender.",
            "Add the banana pieces into the blender.",
            "Measure and pour the honey into the blender.",
            "Blend all the ingredients together until smooth.",
            "Taste the smoothie and adjust sweetness if needed by adding more honey.",
            "Once satisfied with the taste, pour the smoothie into a glass.",
            "Serve immediately and enjoy your refreshing Banana Smoothie!"
        ], imageFilePath: "bananaSmoothie")
    ]
    
        
    #endif
}
