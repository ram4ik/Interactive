//
//  SwiftUIPasswordToggleTextFieldSecureField.swift
//  Interactive
//
//  Created by Ramill Ibragimov on 17.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct SwiftUIPasswordToggleTextFieldSecureField: View {
    @State private var password = ""
    
    var body: some View {
        PasswordToggle(placeholder: "Enter password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
}

struct PasswordToggle: View {
    @State private var passwordHidden = true
    @State private var passwordIcon = "eye.slash"
    
    private var password: Binding<String>
    private var placeholder: String
    
    init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.password = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if self.passwordHidden {
                SecureField(placeholder, text: password)
            } else {
                TextField(placeholder, text: password)
                    .autocapitalization(.none)
            }
            
            Button(action: {
                self.passwordHidden.toggle()
                if self.passwordHidden {
                    self.passwordIcon = "eye.slash"
                } else {
                    self.passwordIcon = "eye"
                }
            }) {
                Image(systemName: self.passwordIcon)
                    .padding(10)
            }
        }
    }
}

struct SwiftUIPasswordToggleTextFieldSecureField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPasswordToggleTextFieldSecureField()
    }
}
