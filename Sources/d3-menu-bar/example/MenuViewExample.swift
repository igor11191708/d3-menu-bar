//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 15.05.2022.
//

import SwiftUI
import d3_color

/// Example view for MenuBar component
struct MenuViewExample: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Cfg

    let items: [MenuItems] = MenuItems.allCases

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


    private var bodyBackground: some View {
        #if os(iOS)
            Rectangle().fill(.thickMaterial)
        #else
            Rectangle().fill(colorScheme == .dark ? .black : .white)
        #endif
    }


    @ViewBuilder
    private var menus: some View {
        Group {
            Text("Min width 102").font(.callout)
            MenuBar(values: items, selected: .one, strategy: .flex(102), color: .green)
                .onSelectionChanged(select)
            Text("Alocate all affodable space, not scrollable")
            MenuBar(values: items, selected: .five, strategy: .fit, color: .blue)
                .onSelectionChanged(select)
            Text("Auto size acoording content")
            MenuBar(values: items, selected: .six, color: .red)
                .onSelectionChanged(select)
        }
        Group {
            Text("Auto size acoording content")
            MenuBar(values: items, selected: .five, color: .purple, style: .square)
                .onSelectionChanged(select)
            Text("Auto size acoording content")
            MenuBar(values: items, color: .orange, style: .square)
                .onSelectionChanged(select)
        }
        Text("Menu with min required params")
        MenuBar(values: items)
            .onSelectionChanged(select)
    }

    private func select(item: MenuItems?) {
        if let text = item?.rawValue{
            print("Selected item \(text)")
        }
    }
}

struct MenuViewExample_Previews: PreviewProvider {

    static var gradient: some View {
        LinearGradient(colors: [.gray.opacity(0.1), .gray.opacity(0.15), .gray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }

    static var previews: some View {
        ZStack {
            gradient
            MenuViewExample()
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.1), radius: 3, x: 3, y: 3)
        }
    }
}


