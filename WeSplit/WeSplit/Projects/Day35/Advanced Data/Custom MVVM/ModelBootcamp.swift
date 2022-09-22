//
//  ModelBootcamp.swift
//  WeSplit
// https://youtu.be/bQQlnGaYN14
//

import SwiftUI

struct ModelBootcamp: View {
    
//    @State var users : [String] = [
//        "Nick", "Emily", "Samantha", "Chris"
//    ]
//    @State var users : [UserModel] = [
//    UserModel(age: 12, displayName: "Nick", followerCount: 213, userName: "NiceNick"),
//    UserModel(age: 32, displayName: "Emily", followerCount: 123, userName: "SusanneSx"),
//    UserModel(age: 31, displayName: "Dxxk", followerCount: 20301, userName: "jasidj")
//    ]
    
    @ObservedObject var viewModel = UserViewModel()
    
    @State var numbers : [Int] = [
        1, 2, 3 , 4, 5, 6
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.userData) { name in //give it all the data
                    
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35)
                        VStack(alignment: .leading) {
                            Text(name.displayName)
                                .fontWeight(.bold)
                            Text(name.userName)//pick out what you want to see
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 10)
                        
                        Spacer()
                        HStack {
                            
                            if name.isVerified {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
//                                }
                            }
                            VStack {
                                Text("\(name.followerCount)")
                                    .fontWeight(.bold)
                                .foregroundColor(.purple)
                                Text("Followers").font(.caption).bold()
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Lol")
                    Text("Lol2")
                    Text("Lol3")
                }

                HStack() {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)")
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
