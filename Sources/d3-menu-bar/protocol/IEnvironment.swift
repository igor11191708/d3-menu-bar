//
//  IEnvironment.swift
//
//
//  Created by Igor Shelopaev on 17.05.2022.
//

import SwiftUI

protocol IEnvironment{


}

extension IEnvironment {

    var is_iOS: Bool {
        #if os(iOS)
            true
        #else
            false
        #endif
    }
}
