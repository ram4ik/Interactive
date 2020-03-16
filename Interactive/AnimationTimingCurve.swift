//
//  AnimationTimingCurve.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct AnimationTimingCurve: View {
    @State private var position: CGSize = CGSize(width: -140, height: 10)
    
    var body: some View {
        VStack {
            ballView(color: .red, animation: .default, position: $position)
            ballView(color: .yellow, animation: .easeIn, position: $position)
            ballView(color: .blue, animation: .easeInOut, position: $position)
            ballView(color: .green, animation: .easeOut, position: $position)
            ballView(color: .purple, animation: .linear, position: $position)
            ballView(color: .orange, animation: .interactiveSpring(), position: $position)
            ballView(color: .gray, animation: .spring(), position: $position)
        }
        .onAppear() {
            self.position = CGSize(width: 140, height: 10)
        }
    }
}

struct ballView: View {
    let color: Color
    let animation: Animation
    
    @Binding var position: CGSize
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 50, height: 50)
            .offset(position)
            .animation(animation.repeatForever(autoreverses: true).speed(0.5))
    }
}

struct AnimationTimingCurve_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingCurve()
    }
}
