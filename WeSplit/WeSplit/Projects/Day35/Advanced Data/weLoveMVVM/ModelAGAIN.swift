//
//  ViewAGAIN.swift
//  WeSplit
//
//

import Foundation //guess you actually dont need swiftui if you dont use views...
struct FigureModel: Identifiable {
    
    let cost : Int
    let delivered : Bool
    let id = UUID()
    let name : String
    let position : String
    
}
