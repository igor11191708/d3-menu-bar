//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 16.05.2022.
//

import SwiftUI

public struct MenuContentView: View {

    @State private var toggleScheme = false

    public init() { }

    public var body: some View {
        NavigationView {
            VStack {
                MenuViewExample()
                    .shadow(color: .black.opacity(0.15), radius: 3, x: 3, y: 3)
                DayNightToggle(toggleScheme: $toggleScheme)
                    .onTapGesture { withAnimation { toggleScheme.toggle() }
                }
            }
                .padding()
                .frame(maxHeight: .infinity)
                .navigationTitle("Menu bar component")
        }
            .setStyle_iOS()
            .environment(\.colorScheme, toggleScheme ? .dark : .light)
    }
}

struct ManuContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuContentView()
    }
}


// MARK: - Bug fixing

//https://stackoverflow.com/questions/65316497/swiftui-navigationview-navigationbartitle-layoutconstraints-issue
extension NavigationView: IEnvironment {
    @ViewBuilder
    func setStyle_iOS() -> some View {
        #if os(iOS)
            self.navigationViewStyle(.stack)
        #else
            self
        #endif
    }
}
