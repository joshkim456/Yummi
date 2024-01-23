//
//  Ingredients.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import Foundation

struct Ingredients {
    var ingredients = [Ingredient(name: "Apple", quantity: 20, unit: .kg, category: .fruitsAndVeg, expiryDate: DateMaker.makeDate(from: "2024-01-01") ?? Date()),
    ]
}

