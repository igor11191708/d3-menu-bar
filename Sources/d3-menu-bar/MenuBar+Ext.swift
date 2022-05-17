//
//  MenuBar+Ext.swift
//
//
//  Created by Igor Shelopaev on 15.05.2022.
//

import SwiftUI

///  Observing menu selection changes via generic PreferenceKey
public extension MenuBar {

    @ViewBuilder
    /// Callback on selection changed just with items as an input param for a closure
    /// - Parameter fn: callback function
    /// - Returns: View
    func onSelectionChanged(_ fn: @escaping (T?) -> Void) -> some View {
        self.onPreferenceChange(MenuItemKey<T>.self) { fn($0) }
    }

}
