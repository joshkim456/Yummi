//
//  Ingredients.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

struct Ingredients {
    var ingredients = [Ingredient(name: "Apple", quantity: 20, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-01-01") ?? Date()),
                       Ingredient(name: "Banana", quantity: 169, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-05-06") ?? Date()),
                       Ingredient(name: "Peach", quantity: 420, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-02-29") ?? Date()),
                       Ingredient(name: "Cow", quantity: 1, unit: .kg, category: .meats, expiryDate: DateMaker.makeDate(from: "2024-08-14") ?? Date())
                       
    ]
}

