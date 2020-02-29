//
//  RotationGestureSwiftUI.swift
//  Interactive
//
//  Created by Ramill Ibragimov on 29.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct RotationGestureSwiftUI: View {
    @State private var rotation: Angle = .zero
    
    var body: some View {
        Image("NY")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .shadow(radius: 20)
            .rotationEffect(rotation)
            .gesture(RotationGesture().onChanged({ (value) in
                self.rotation = value
            }))
    }
}

struct RotationGestureSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureSwiftUI()
    }
}
