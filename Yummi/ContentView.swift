//
//  ContentView.swift
//  Yummi
//
//  Created by Kim, Joshua (WING) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    var ingredient: Ingredient?
    
    init() {
            if let specificDate = DateMaker.makeDate(from: "2024-01-01") {
                ingredient = Ingredient(name: "Apple", quantity: 20, unit: .kg, category: .fruitsAndVeg, expiryDate: specificDate)
            }
        }
    
    var body: some View {
        Form {
            VStack {
                if let ingredient = ingredient {
                    Text(ingredient.displayInformation())
                } else {
                    Text("Invalid Date Format")
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
