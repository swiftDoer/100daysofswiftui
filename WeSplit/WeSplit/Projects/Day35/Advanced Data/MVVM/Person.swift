//
//  Person.swift
//  WeSplit
//https://www.youtube.com/watch?v=uQtM6StTsQg&ab_channel=LoganKoshenka
// this is the M(Model) in MVVM
// this is a custom data type - so something just like [String] but it actually stores more data than must a String.

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name : String
    var email : String
    var phoneNumber : String
}
