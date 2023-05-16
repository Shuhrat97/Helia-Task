//
//  UniversalRouter.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 15/05/23.
//

import SwiftUI

class UniversalRouter: ObservableObject {
    @Published var startRouting: Bool = false
    
    var scene: AnyView? {
        didSet {
            startRouting = scene != nil
        }
    }
}
