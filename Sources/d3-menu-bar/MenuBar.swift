//
//  MenuBar.swift
//
//
//  Created by Igor Shelopaev on 13.05.2022.
//

import SwiftUI

/// Define enum with menu items conforming to ```IMenuItem```
///
/// ```enum MenuItems: String, IMenuItem {
/// case one = "one"
/// case two = "two"
/// case three = "three"
/// }```
///
/// Pass allCases as a parameter
///
/// ```MenuBar(values: MenuItems.allCases)
/// .onSelectionChanged{ item in }```
///
/// Observing menu selection changes via generic PreferenceKey in ```MenuBar+Ext.swift```
/// Pass a clouser to ```onSelectionChanged```
/// if you need react on selection changed. In this case it does not trigger rerender as if in case you used passing selected item via binding
///
@available(iOS 15.0, macOS 12.0, watchOS 6.0, *)
public struct MenuBar<T>: View where T: IMenuItem {

    /// A dynamic property type that allows access to a namespace used for
    @Namespace private var animation

    // MARK: - Config

    /// Selected item
    @State var selected: T?

    /// Menu items
    let values: [T]

    /// Size strategy
    /// Default strategy for the item width ```auto```
    let strategy: Strategy

    /// menu color
    let color: Color?

    /// menu style
    let style: Style

    // MARK: - Life circle

    /// - Parameters:
    ///   - values: Menu items ```required```
    ///   - selected: Selected item
    ///   - size: Size strategy
    ///   - color: Main color
    public init(values: [T], selected: T? = nil, strategy: Strategy = .auto, color: Color? = nil, style: Style = .round) {
        self.values = values
        _selected = State(initialValue: selected)
        self.strategy = strategy
        self.color = color
        self.style = style
    }

    /// The content and behavior of the view.
    public var body: some View {
        Group {
            if strategy == .fit {
                menuTpl
            } else {
                ScrollView(.horizontal, showsIndicators: showsIndicators) {
                    ScrollViewReader { proxy in
                        menuTpl
                            .onAppear { restoreScrollPosition(proxy) }
                    }
                }
            }
        }.preference(key: MenuItemKey<T>.self, value: selected)
    }

    // MARK: - Private


    /// Restore scroll position accroding the selection
    /// - Parameter proxy: scroll proxy
    private func restoreScrollPosition(_ proxy: ScrollViewProxy) {
        if let s = selected {
            proxy.scrollTo(s.rawValue)
        }
    }

    @ViewBuilder
    /// Item template
    /// - Parameter tab: Tab data
    /// - Returns: Item view
    private func itemTpl(_ tab: T) -> some View {
            if style == .round {
                itemBuilder(tab, RoundedTpl.self)
            } else {
                itemBuilder(tab, SquareTpl.self)
            }
    }

    /// Define view template for cirtain style
    @ViewBuilder
    private func itemBuilder<S : IStyleTpl>(_ tab: T,_ tpl: S.Type) -> some View {
        let isSelected = selected == tab
        let text = tab.rawValue
        let id = tab.id

        ItemTpl(id: id , strategy: strategy, isSelected: isSelected, ns: animation, text: text, color: color, tpl: tpl)
    }

    @ViewBuilder
    /// Menu template
    private var menuTpl: some View {
        HStack(spacing: 10) {
            ForEach(values, id: \.self) { tab in
                itemTpl(tab)
                    .onTapGesture { withAnimation { selected = tab } }
            }
        }
    }

    private var showsIndicators: Bool {
        #if os(iOS)
            false
        #else
            true
        #endif
    }

    // MARK: - Inner enum, struct

    /// Size strategy
    /// ```fit``` - Alocate all affodable space
    /// ```auto``` - Auto size acoording content
    /// ```flex``` - Set up minimal width
    public enum Strategy: Equatable {
        case auto
        case fit
        case flex(CGFloat)
    }
    
    /// Menu item style
    public enum Style: Equatable {
        case round
        case square
    }

}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MenuViewExample()
                .shadow(color: .black.opacity(0.15), radius: 3, x: 3, y: 3)
        }.padding(.horizontal)
    }
}





