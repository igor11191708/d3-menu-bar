//
//  IMenuItem.swift
//  
//
//  Created by Igor Shelopaev on 13.05.2022.
//

import Foundation


/// Defines set of expectations for menu item
/// Define enum with menu items conforms to ```IMenuItem```
/// ```enum MenuItems: String, IMenuItem {
/// `` case one = "one"
/// `` case two = "two"
/// ``` }
public protocol IMenuItem: Hashable, RawRepresentable, CaseIterable, Identifiable where Self.RawValue : Comparable & StringProtocol {
        
    /// unique identifier
    var id : String { get }
    
}


extension IMenuItem where Self.RawValue == String{

    /// unique identifier
    var id : String{
        self.rawValue
    }
}
