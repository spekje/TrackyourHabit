//
//  DesignSettings.swift
//  TrackyourHabit
//
//  Created by Suzanne on 12/12/2024.
//

import SwiftUI

struct backGround : ViewModifier {
    func body(content: Content) ->some View {
        content
            .frame(maxWidth: .infinity)
            .padding(20)
        
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.yellow)
            .toolbarBackground(.yellow)
    }
}
extension View {
    func backGroundStyle() -> some View {
        modifier(backGround())
    }
}


struct buttonStyleGreen : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(25)
            .background(Color.green)
            .clipShape(Capsule())
    }
}

extension View {
    func buttonStylingGreen() -> some View {
        modifier(buttonStyleGreen())
        
    }
}

