//
//  RadialGradient.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct RadialGradient: View {
    
    @State private var gradientColor: [Color] = [.green, .blue]
    @State private var startRadius: CGFloat = 1
    @State private var endRadius: CGFloat = 1000
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.green)
                .frame(width: 200, height: 200)
                .shadow(color: .white, radius: 20, x: 0, y: 0)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.startRadius = CGFloat(Int(self.startRadius) % 1000)
                    self.endRadius = CGFloat(Int(self.endRadius) % 1000)
            }
            
        }
    }
}

struct RadialGradient_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradient()
    }
}
