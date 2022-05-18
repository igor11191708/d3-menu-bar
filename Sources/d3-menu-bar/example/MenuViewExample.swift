//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 15.05.2022.
//

import SwiftUI

/// Example view for MenuBar component
struct MenuViewExample: View, IEnvironment {

    @Environment(\.colorScheme) var colorScheme

    // MARK: - Cfg

    let items: [MenuItems] = MenuItems.allCases
    
    @State var selected : MenuItems? = .one

    // MARK: - Life circle

    var body: some View {
        VStack(alignment: .leading) {
            menus
        }
            .padding()
            .foregroundColor(.gray)
            .background(bodyBackground)
            .cornerRadius(25)
            .font(.callout)
    }

    // MARK: - Private

    @ViewBuilder
    private var bodyBackground: some View {
        if is_iOS {
            Rectangle().fill(.thickMaterial)
        } else {
            Rectangle().fill(colorScheme == .dark ? .black : .white) }
    }

    @ViewBuilder
    private func buildMenu(
        values: [MenuItems],
        selected: MenuItems? = nil,
        strategy: Strategy = .auto,
        color: Color? = nil,
        style: Style = .round)
        -> some View {
        MenuBar(values: values, selected: $selected, strategy: strategy, color: color, style: style).onSelectionChanged(select)
    }

    @ViewBuilder
    private var menus: some View {
        Group {
            Text("Min width 102").font(.callout)
            buildMenu(values: items, selected: .one, strategy: .flex(102), color: .green)
            Text("Alocate all affodable space, not scrollable")
            buildMenu(values: items, selected: .five, strategy: .fit, color: .blue)
            Text("Auto size acoording content")
            buildMenu(values: items, selected: .six, color: .red)
        }
        Group {
            Text("Auto size acoording content")
            buildMenu(values: items, selected: .five, color: .purple, style: .square)
            Text("Auto size acoording content")
            buildMenu(values: items, color: .orange, style: .square)
            Text("Menu with min required params")
            buildMenu(values: items)
        }
    }

    private func select(item: MenuItems?) {
        if let text = item?.rawValue {
            print("Selected item \(text)")
        }
    }
}

struct MenuViewExample_Previews: PreviewProvider {

    static var previews: some View {
        MenuViewExample()
    }
}


fileprivate typealias Strategy = MenuBar<MenuItems>.Strategy
fileprivate typealias Style = MenuBar<MenuItems>.Style


