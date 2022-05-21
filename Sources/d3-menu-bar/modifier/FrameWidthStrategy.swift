//
//  FrameWidthStrategy.swift
//  
//
//  Created by Igor Shelopaev on 17.05.2022.
//

import SwiftUI

/// Defines with strategy for menu item
struct FrameWidthStrategy<T: IMenuItem>: ViewModifier {

    /// Size strategy
    let strategy: MenuBar<T>.Strategy

    /// The content and behavior of the view.
    func body(content: Content) -> some View {
        switch strategy {
        case .auto: content.padding(.horizontal)
        case .fit: content.frame(maxWidth: .infinity)
        case .flex(let width): content.frame(minWidth: width, maxWidth: .infinity)
        }
    }
}
