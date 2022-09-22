//
//  BittunView.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import Foundation

class ButtonViewModel: ObservableObject {
    
    @Published var selectedButtonArray = [Int]()
    
    @Published var buttonArray1 = [
        ButtonPressed(number: 1),
        ButtonPressed(number: 2),
        ButtonPressed(number: 3),
        ButtonPressed(number: 4),
        ButtonPressed(number: 5),
        ButtonPressed(number: 6),
    ]
    
    
    @Published var buttonArray2 = [
        ButtonPressed(number: 7),
        ButtonPressed(number: 8),
        ButtonPressed(number: 9),
        ButtonPressed(number: 10),
        ButtonPressed(number: 11),
        ButtonPressed(number: 12),
    ]
    
    
//    func playGame() {
//        let ranNum = selectedButtonArray.randomElement()
//
//    }
    
    
    func addToArray(number: Int) {
        if selectedButtonArray.contains(number) {
            let position = selectedButtonArray.firstIndex(of: number)
            selectedButtonArray.remove(at: position ?? 0)
        } else {
            selectedButtonArray.append(number)
        }
    }
}
