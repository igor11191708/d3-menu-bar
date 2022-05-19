//
//  IMenuItem.swift
//  
//
//  Created by Igor Shelopaev on 13.05.2022.
//

import Foundation


/// Defines set of expectations for menu item.
/// Define enum with menu items conforms to ``IMenuItem``
///
///     enum MenuItems: String, IMenuItem {
///         case one = "one"
///         case two = "two"
///      }
public protocol IMenuItem: Hashable, RawRepresentable, CaseIterable, Identifiable where Self.RawValue : Comparable & StringProtocol {
        
    /// Unique identifier
    var id : String { get }
    
}


public extension IMenuItem where Self.RawValue == String{

    /// Unique identifier
    var id : String{
        self.rawValue
    }
}

/// This function returns a *hello* string for a given `subject`.
///
/// - Warning: The returned string is not localized.
///
/// Usage:
///
///     print(hello("Markdown")) // Hello, Markdown!
///
/// - Parameter subject: The subject to be welcomed.
///
/// - Returns: A hello string to the `subject`.
func hello(subject: String) -> String {
    return "Hello, \(subject)!"
}
