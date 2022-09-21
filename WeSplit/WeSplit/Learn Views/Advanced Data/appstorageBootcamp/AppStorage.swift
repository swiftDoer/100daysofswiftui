//
//  AppStorage.swift
//  WeSplit
//
//

import SwiftUI

struct AppStorage2: View {
    
//    @State var currentUserName : String?
    @AppStorage("name") var currentUserName: String?

    var body: some View {
        VStack(spacing: 20) {
            if currentUserName == nil {
//                Text(currentUserName ?? "Add name here") }
                Text("Add name here") }
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name = "Nic"
                currentUserName = name
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        .onAppear(){
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage2()
    }
}
