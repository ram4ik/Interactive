//
//  GradientColor&UnitPoint.swift
//  Interactive
//
//  Created by ramil on 16.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct GradientColor_UnitPoint: View {
    
    let gradient = Gradient(stops: [
        .init(color: .green, location: 0),
        .init(color: .blue, location: 0.5),
        .init(color: .purple, location: 1)
    ])
    
    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: UnitPoint(x: 0.3, y: 0.9))
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientColor_UnitPoint_Previews: PreviewProvider {
    static var previews: some View {
        GradientColor_UnitPoint()
    }
}
