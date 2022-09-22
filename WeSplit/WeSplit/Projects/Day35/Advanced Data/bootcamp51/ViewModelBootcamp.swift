//
//  ViewModelBootcamp.swift
//  WeSplit
//https://youtu.be/-yjKAb0Pj60
//

import SwiftUI

struct ViewModelBootcamp: View {
    
//    @ObservedObject var fruit = FruitViewModel()
    @StateObject var fruit = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                if fruit.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruit.fruitArray) { item in
                        HStack {
                            Text("\(item.count)")
                                .foregroundColor(.red)
                            
                            HStack(spacing: 0) { //removes space between the s and item.name
                                Text(item.name)
                                item.count > 1 ? Text("s") : Text("")
                            }
                            .font(.headline)
                            .bold()
                        }
                    }
                    .onDelete(perform: fruit.deleteFruit)
                }
            }
            .navigationTitle("Fruit List")
            .toolbar(content: {
                NavigationLink(destination: {
                    SecondScreen(fruits: fruit)
                }, label: {
                    Image(systemName: "arrow.right")
                })
            })
            .listStyle(GroupedListStyle())
//            .onAppear {
//                fruit.getFruits()
//            }
        }
    }
}

struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
    }
}
