//
//  UserModel.swift
//  WeSplit
// https://youtu.be/bQQlnGaYN14
// Model from this MVVM

import SwiftUI
struct UserModel: Identifiable{
    
    let id = UUID()
    let age : Int
    let displayName : String
    let followerCount : Int
    let userName : String
    let isVerified : Bool
    
}
