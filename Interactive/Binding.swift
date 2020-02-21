//
//  Binding.swift
//  Interactive
//
//  Created by ramil on 21.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct MyBinding: View {
    var recipes = Recipe.allRecipes()
    @State var showIngredience = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showIngredience) {
                Text("Show Ingredients")
            }.padding()
            
            List {
                ForEach(recipes) { receipe in
                    ReceipeCell(receipe: receipe, showIngredience: self.$showIngredience)
                }
            }
        }
    }
}

struct ReceipeCell: View {
    var receipe: Recipe
    @Binding var showIngredience: Bool
    
    var body: some View {
        Group {
            Text(receipe.name)
                .foregroundColor(.blue)
            
            if self.showIngredience {
                Text(receipe.ingredients.joined(separator: "\n"))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct MyBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyBinding()
    }
}

struct Recipe: Identifiable {
    var id: UUID = UUID()
    var name: String
    var ingredients: [String]
    
    static func allRecipes() -> [Recipe] {
        return [
            Recipe(name: "Receine one", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ]),
            Recipe(name: "Receine two", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ]),
            Recipe(name: "Receine three", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ])
        ]
    }
}
