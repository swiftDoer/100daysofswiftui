//
//  EnvironmentThing.swift
//  WeSplit
//

import Foundation
class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray : [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append("iPhone")
        self.dataArray.append("iPad")
        self.dataArray.append(contentsOf: ["iMac", "Apple Watch"])
    }
}

