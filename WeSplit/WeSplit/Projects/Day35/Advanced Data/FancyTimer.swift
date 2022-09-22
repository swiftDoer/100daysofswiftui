//
//  FancyTimer.swift
//  WeSplit
//
//https://www.youtube.com/watch?v=VioWHKN1eKs&ab_channel=azamsharp
//

import Combine
import Foundation
import SwiftUI

class FancyTimer: ObservableObject {
    
    @Published var value : Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
