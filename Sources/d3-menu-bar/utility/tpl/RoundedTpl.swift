//
//  SwiftUIView.swift
//  
//
//  Created by Igor Shelopaev on 17.05.2022.
//

import SwiftUI

struct RoundedTpl: View, IStyleTpl {
    
    /// sign of selection
    let isSelected: Bool

    /// ns for animation
    let ns: Namespace.ID

    /// Item color
    let color: Color
    
    var body: some View {
        if isSelected {
            Capsule()
                .fill(color)
                .matchedGeometryEffect(id: "TAB", in: ns)
        } else {
            Capsule()
                .stroke(color, lineWidth: 1.5)
        }
    }
}
