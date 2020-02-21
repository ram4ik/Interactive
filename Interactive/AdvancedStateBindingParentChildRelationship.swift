//
//  AdvancedStateBindingParentChildRelationship.swift
//  Interactive
//
//  Created by ramil on 21.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct AdvancedStateBindingParentChildRelationship: View {
    @State private var todos = [ToDo]()
    
    var body: some View {
        List {
            Button(action: addToDo) {
                Text("Add Item")
            }
            ForEach(todos.indices, id: \.self) { idx in
                ToDoCell(todo: self.$todos[idx])
            }
        }
    }
    
    func addToDo() {
        todos.append(ToDo(name: "\(Date())", isCompleted: false))
    }
}

struct ToDoCell: View {
    @Binding var todo: ToDo
    
    var body: some View {
        HStack {
            Text(todo.name)
            Spacer()
            Toggle(isOn: $todo.isCompleted) {
                Text("")
            }.labelsHidden()
        }
    }
}

struct ToDo: Identifiable {
    var id: UUID = UUID()
    var name: String
    var isCompleted: Bool
}

struct AdvancedStateBindingParentChildRelationship_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedStateBindingParentChildRelationship()
    }
}
