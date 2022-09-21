//
//  ViewModel.swift
//  WeSplit
//
//

import SwiftUI
class NicePersonViewModel : ObservableObject {
    
    @Published var NicePersonViewModel : [NicePersonModel] = []
    
    let nicePersonViewModelArray = [
    NicePersonModel(isOnline: true, govName: "Nick", internalName: "Chicken69", spiedOnAmount: 0),
    NicePersonModel(isOnline: true, govName: "Jack", internalName: "Hammer", spiedOnAmount: 6),
    NicePersonModel(isOnline: false, govName: "Lilly", internalName: "Cock73", spiedOnAmount: 9),
    ]
    
}



