//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 15.05.2022.
//

import d3_color
import SwiftUI

/// Template for menu item
struct ItemTpl<T: IMenuItem, S: IStyleTpl>: View {
    @Environment(\.colorScheme) var colorScheme

    // MARK: - Cfg

    let id: String

    /// Size strategy
    let strategy: MenuBar<T>.Strategy

    /// sign of selection
    let isSelected: Bool

    /// ns for animation
    let ns: Namespace.ID

    /// Item's text
    let text: T.RawValue

    /// Item color
    let color: Color?

    let tpl: S.Type

    // MARK: - Life circle

    /// The content and behavior of the view.
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(selectedFontColor)
            .padding(.vertical, 6)
            .modifier(FrameWidthStrategy(strategy: strategy))
            .lineLimit(1)
            .background(bg(isSelected, ns, mainColor).scaleEffect(0.95))
            .contentShape(Capsule())
            .id(id)
    }

    // MARK: - Private

    @ViewBuilder
    /// Defines background for selected and none selected item
    private func bg(_ isSelected: Bool, _ ns: Namespace.ID, _ color: Color) -> some View {
        tpl.init(isSelected: isSelected, ns: ns, color: color)
    }

    private var defaultColor: Color {
        colorScheme == .dark ? .white : .black
    }

    private var selectedFontColor: Color {
        let fontColor: Color = colorScheme == .dark ? .black : .white
        return isSelected ? fontColor : mainColor
    }

    /// adjust the color intensity depending on color scheme (Color+Ext.swift) https://github.com/swiftuiux/d3-color
    private var mainColor: Color {
        if let c = color {
            return colorScheme == .dark ? c.doBrighter(k: 0.1) : c
        }
        return defaultColor
    }
}
