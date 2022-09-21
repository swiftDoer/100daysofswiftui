//
//  PeopleViewMVVM.swift
//  WeSplit
//  https://www.youtube.com/watch?v=uQtM6StTsQg&ab_channel=LoganKoshenka
// this is the V(View) in MVVM

import SwiftUI

struct PeopleViewMVVM: View {
    
    @ObservedObject var viewModel = PersonViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(viewModel.people) { person in
                        HStack {
                            Text(person.name)
                                .font(.title).bold()
                            
                            Spacer()
                            
                            VStack {
                                Text(person.phoneNumber)
                                Text(person.email)
                            }
                        }
                        .padding()
                    }
                }
            }
            Menu("MENU", content: {
                Button("Reverse", action: { viewModel.reverseOrder() })
                Button("Shuffle", action: { viewModel.shuffleOrder() })
                Button("Remove Last", action: { viewModel.removeLastPerson() })
                Button("Remove First", action: { viewModel.removeFirstPerson() })
            })
            .padding()
        }
    }
    
//    var body: some View {
//        ForEach(viewModel.people) { person in
//            HStack {
//                Text("John")
//                    .font(.title).bold()
//
//                Spacer()
//
//                VStack {
//                    Text("44-444-444")
//                    Text("email@emaol.com")
//                }
//            }
//            .padding()
//        }
//    }
}

struct PeopleViewMVVM_Previews: PreviewProvider {
    static var previews: some View {
        PeopleViewMVVM()
    }
}
