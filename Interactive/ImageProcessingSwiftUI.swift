//
//  ImageProcessingSwiftUI.swift
//  Interactive
//
//  Created by ramil on 20.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ImageProcessingSwiftUI: View {
    var body: some View {
        VStack {
            Image("guitar")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 350)
                .padding()
                .border(Color.orange, width: 1)
                .opacity(0.7)
                .shadow(color: .orange, radius: 10, x: 0, y: 0)
                .blur(radius: 0.01)
                .brightness(0.1)
                .colorInvert()
                .colorMultiply(.orange)
                .contrast(1.5)
                .hueRotation(Angle(degrees: 90))
                .saturation(0.5)
                .grayscale(5)
                .luminanceToAlpha()
        }
    }
}

struct ImageProcessingSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ImageProcessingSwiftUI()
    }
}
