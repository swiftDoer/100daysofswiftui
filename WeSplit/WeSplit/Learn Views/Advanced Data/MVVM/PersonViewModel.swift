//
//  PersonViewModel.swift
//  WeSplit
//https://www.youtube.com/watch?v=uQtM6StTsQg&ab_channel=LoganKoshenka
// this is the VM(ViewModel) in MVVM

import SwiftUI
class PersonViewModel: ObservableObject {
    @Published var people : [Person] = [] //Person is our M(Model) in MVVM
    
    init() {
        addPeople()
    }
    
    func addPeople() {
        people = peopleData
    }
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeLastPerson() {
        people.removeLast()
    }
    
    func removeFirstPerson() {
        people.removeFirst()
    }
}

let peopleData = [
    Person(name: "John Snow", email: "jonhnmail", phoneNumber: "44-3-69"),
    Person(name: "John Wroh", email: "wrohnmail", phoneNumber: "44-3-4124"),
    Person(name: "John Genk", email: "genknmail", phoneNumber: "44-332-69"),
    Person(name: "John Tenki", email: "tenkhnmail", phoneNumber: "44-3213-69"),
    Person(name: "John Klog", email: "kloggmail", phoneNumber: "44-3-6439"),
    
]
