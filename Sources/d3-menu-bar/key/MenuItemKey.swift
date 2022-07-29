//
//  MenuItemKey.swift
//
//
//  Created by Igor Shelopaev on 15.05.2022.
//

import SwiftUI

/// A named value produced by ```MenuView```
struct MenuItemKey<T: IMenuItem>: PreferenceKey {
    typealias Value = T?

    static var defaultValue: Value { nil }

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
