//
//  fourView.swift
//  WeSplit
//
//

import Foundation

class BreadViewModel: ObservableObject {
    
    @Published var breadArray : [Bread] = [
    Bread(amount: 14, baked: false, color: "White"),
    Bread(amount: 24, baked: true, color: "Black"),
    Bread(amount: 3, baked: false, color: "Brown"),
    Bread(amount: 0, baked: false, color: "Mixed") // if amount is 0, baked is always false anyway
    ]
    
}
