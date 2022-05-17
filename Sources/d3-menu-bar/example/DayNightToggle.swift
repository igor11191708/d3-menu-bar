//
//  SwiftUIView.swift
//
//
//  Created by Igor Shelopaev on 16.05.2022.
//

import SwiftUI


/// Toggle control
struct DayNightToggle: View {
    
    // MARK: - Cfg
    
    /// true - light mode, false - dark mode
    @Binding var toggleScheme: Bool
    
    // MARK: - Life circle
    
    var body: some View {
        ZStack {
            if toggleScheme {
                Image(systemName: "moon.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "sun.max.fill").foregroundColor(.orange)
            }
        }.frame(height: 50).font(.system(size: 50)).padding()
    }
}

struct DayNightToggle_Previews: PreviewProvider {
    static var previews: some View {
        DayNightToggle(toggleScheme: .constant(true))
    }
}
