//
//  SpringAnimation.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct SpringAnimation: View {
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 1
    
    var body: some View {
        Image(systemName: "paperplane.fill")
            .font(.largeTitle)
            .rotationEffect(.degrees(angle))
            .scaleEffect(scale)
            .foregroundColor(.orange)
            .animation(Animation.spring().repeatForever(autoreverses: true))
            .onAppear() {
                self.angle = 360
                self.scale = 2
        }
    }
}

struct SpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimation()
    }
}
