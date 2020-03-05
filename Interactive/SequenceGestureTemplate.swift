 //
//  SequenceGestureTemplate.swift
//  Interactive
//
//  Created by ramil on 05.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct SequenceGestureTemplate: View {
    @State private var offset: CGSize = .zero
    @State private var translation: CGSize = .zero
    @State private var canDrag: Bool = false
    
    var body: some View {
        let longPress = LongPressGesture(minimumDuration: 1).onEnded { _offset in
            self.canDrag = true
        }
        
        let drag = DragGesture().onChanged { (value) in
            self.translation = value.translation
            self.canDrag = true
        }.onEnded { (value) in
            self.offset.width += value.translation.width
            self.offset.height += value.translation.height
            self.translation = .zero
            self.canDrag = false
        }
        
        let longPressAndDrug = longPress.sequenced(before: drag)
        
        return Image("NY")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(canDrag ? Circle().stroke(Color.gray) : nil)
            .frame(width: 200, height: 200)
            .offset(x: offset.width + translation.width, y: offset.height + translation.height)
            .shadow(radius: canDrag ? 10 : 1)
            .gesture(longPressAndDrug)
    }
}

struct SequenceGestureTemplate_Previews: PreviewProvider {
    static var previews: some View {
        SequenceGestureTemplate()
    }
}
