//
//  SwiftUIClearableTextFieldCustomControl.swift
//  Interactive
//
//  Created by Ramill Ibragimov on 17.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct SwiftUIClearableTextFieldCustomControl: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Enter your search here", text: $text)
            .clearable(text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

extension TextField {
    func clearable(text: Binding<String>) -> some View {
        self.modifier(TextFieldClear(text: text))
    }
}

struct TextFieldClear: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if (!text.isEmpty) {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.secondary)
                }.padding(.horizontal, 10)
            }
        }
    }
}

struct SwiftUIClearableTextFieldCustomControl_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIClearableTextFieldCustomControl()
    }
}
