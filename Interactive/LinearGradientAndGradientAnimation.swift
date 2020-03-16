//
//  LinearGradientAndGradientAnimation.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct LinearGradientAndGradientAnimation: View {
    @State private var gradientColor: [Color] = [.white, .blue]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: gradientColor), startPoint: UnitPoint(x: 0.1, y: 0.1), endPoint: UnitPoint(x: 0.9, y: 0.9)))
                .animation(Animation.easeIn)
                .gesture(TapGesture().onEnded({ (_) in
                    self.gradientColor = [self.getRandomColor(), self.getRandomColor()]
                }))
        }.edgesIgnoringSafeArea(.all)
    }
    
    func getRandomColor() -> Color {
        let r = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        return Color(red: r, green: g, blue: b)
    }
}

struct LinearGradientAndGradientAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientAndGradientAnimation()
    }
}
