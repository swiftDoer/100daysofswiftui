//
//  UserViewModel.swift
//  WeSplit
//
//

import SwiftUI
class UserViewModel: ObservableObject {
    @Published var users : [UserModel] = []
    
    let userData = [
    UserModel(age: 15, displayName: "Sarah", followerCount: 134, userName: "sarah.xx", isVerified: false),
    UserModel(age: 16, displayName: "John", followerCount: 13, userName: "slayer:D", isVerified:  false),
    UserModel(age: 32, displayName: "Schatzxx", followerCount: 2131, userName: "girl:PUPPET", isVerified: false),
    UserModel(age: 121, displayName: "Mam", followerCount: 3212, userName: "CookingShower", isVerified: true)
    ]
}
