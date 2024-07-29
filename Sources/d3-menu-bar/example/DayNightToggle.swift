//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 16.05.2022.
//

import SwiftUI

/// Toggle control for example view
@available(iOS 15.0, macOS 12.0, tvOS 16.0, watchOS 7.0, *)
public struct DayNightToggle: View {
    // MARK: - Cfg

    /// true - light mode, false - dark mode
    @Binding var toggleScheme: Bool

    // MARK: - Life circle

    public init(toggleScheme: Binding<Bool>) {
        _toggleScheme = toggleScheme
    }

    public var body: some View {
        ZStack {
            if toggleScheme {
                Image(systemName: "moon.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "sun.max.fill").foregroundColor(.orange)
            }
        }.frame(height: 50)
            .frame(maxWidth: .infinity)
            .font(.system(size: 50))
            .padding()
            .onTapGesture { withAnimation { toggleScheme.toggle() } }
    }
}

struct DayNightToggle_Previews: PreviewProvider {
    static var previews: some View {
        DayNightToggle(toggleScheme: .constant(true))
    }
}
