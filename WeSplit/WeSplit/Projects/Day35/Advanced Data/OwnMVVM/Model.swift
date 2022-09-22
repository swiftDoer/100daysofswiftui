//
//  Model.swift
//  WeSplit
//
//

import SwiftUI

struct NicePersonModel: Identifiable {
    
    let id = UUID()
    let isOnline : Bool
    let govName : String
    let internalName : String
    let spiedOnAmount : Int
    
}
