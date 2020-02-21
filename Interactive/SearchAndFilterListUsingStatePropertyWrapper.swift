//
//  SearchAndFilterListUsingStatePropertyWrapper.swift
//  Interactive
//
//  Created by ramil on 21.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct SearchAndFilterListUsingStatePropertyWrapper: View {
    var myRecipes = MyRecepi.allRecipes()
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("search ingredients here", text: $searchTerm)
            }.padding()
            
            List {
                ForEach(myRecipes.filter({ recipe -> Bool in
                    if searchTerm.isEmpty { return true }
                    return recipe.ingredients.filter { ingredient -> Bool in
                        return ingredient.contains(searchTerm.lowercased())
                    }.count > 0
                })) { recepe in
                    Text(recepe.name)
                    Text(recepe.ingredients.joined(separator: "\n"))
                        .lineLimit(nil)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct MyRecepi: Identifiable {
    var id: UUID = UUID()
    var name: String
    var ingredients: [String]
    
    static func allRecipes() -> [MyRecepi] {
        return [
            MyRecepi(name: "Receine one", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ]),
            MyRecepi(name: "Receine two", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ]),
            MyRecepi(name: "Receine three", ingredients: [
                "Milk",
                "Flour",
                "Eggs"
            ])
        ]
    }
}

struct SearchAndFilterListUsingStatePropertyWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilterListUsingStatePropertyWrapper()
    }
}
