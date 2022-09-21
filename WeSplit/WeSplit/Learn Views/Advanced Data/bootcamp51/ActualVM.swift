//
//  ActualVM.swift
//  WeSplit
//
//

import Foundation
class FruitViewModel: ObservableObject {
    
     // yeah you want to go new -> old instead of old -> new - that way you also have can have all the variables up on top for when youre creating a new function.
    
    init(){
        getFruits()
    }
    
    @Published var isLoading: Bool = false
    @Published var fruitArray : [FruitModel] = [
    FruitModel(count: 2, name: "Banana"),
    FruitModel(count: 3, name: "Apple"),
    FruitModel(count: 1, name: "Orange"),
    FruitModel(count: 0, name: "Mango")
    ]
    
    
    func getFruits() {
        let fruit1 = FruitModel(count: 4, name: "Orange")
        let fruit2 = FruitModel(count: 2, name: "Kiwi")
        let fruit3 = FruitModel(count: 0, name: "Grape")
        let fruit4 = FruitModel(count: 69, name: "Watermelon")
        
        isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                self.fruitArray.append(fruit1)
                self.fruitArray.append(fruit2)
                self.fruitArray.append(fruit3)
                self.fruitArray.append(fruit4)
                self.isLoading = false
            })
    }
    
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}


