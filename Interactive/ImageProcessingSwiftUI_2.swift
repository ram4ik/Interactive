//
//  ImageProcessingSwiftUI_2.swift
//  Interactive
//
//  Created by ramil on 20.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ImageProcessingSwiftUI_2: View {
    var body: some View {
        ZStack {
            Image("NY")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 350)
            
            Image("guitar")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 350)
                .blendMode(.difference)
                
        }
        .mask(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("New York").font(.system(size: 100)).bold()
                    Spacer()
                }
                Spacer()
            }
            
        )
            .scaleEffect(1.5)
        
    }
}

struct ImageProcessingSwiftUI_2_Previews: PreviewProvider {
    static var previews: some View {
        ImageProcessingSwiftUI_2()
    }
}
