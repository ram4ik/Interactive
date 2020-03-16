//
//  ColorAnimation.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ColorAnimation: View {
    @State private var color: Color = .white
    
    var body: some View {
        Rectangle()
            .fill(color)
            .edgesIgnoringSafeArea(.all)
            .animation(Animation.easeInOut)
            .gesture(TapGesture().onEnded({ (_) in
                self.color = self.getRandomColor()
            }))
    }
    
    func getRandomColor() -> Color {
        let r = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        return Color(red: r, green: g, blue: b)
    }
}

struct ColorAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ColorAnimation()
    }
}
