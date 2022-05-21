//
//  IStyleTpl.swift
//  
//
//  Created by Igor Shelopaev on 17.05.2022.
//

import SwiftUI


/// Define interface for style tpl view
protocol IStyleTpl: View{
    
    /// sign of selection
    var isSelected: Bool { get }

    /// ns for animation
    var ns: Namespace.ID  { get }

    /// Item color
    var color: Color  { get }
    
    /// Initilizer
    init(isSelected: Bool, ns: Namespace.ID, color: Color)
    
}
