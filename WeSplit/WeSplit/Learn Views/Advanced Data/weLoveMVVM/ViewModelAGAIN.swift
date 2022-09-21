//
//  ViewModelAGAIN.swift
//  WeSplit
//
//

import Foundation //not only do you not need swiftui
class FigureViewModel: ObservableObject {
    
    @Published var figureViewModel : [FigureModel] = [ //but you dont even have to create a new constant just to store all the data
        
        FigureModel(cost: 20, delivered: true, name: "Shirakami Fubuki", position: "Sitting"),
        FigureModel(cost: 40, delivered: false, name: "Shirakami Fubuki", position: "Standing"),
        FigureModel(cost: 60, delivered: false, name: "Smoll Shirakami Fubuki", position: "Standing"),
        FigureModel(cost: 40, delivered: true, name: "Houshou Marine", position: "Standing")
        
    ]
}
