//
//  SecondScreen.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import SwiftUI

struct SecondScreen: View {
    
    @ObservedObject var fruits: FruitViewModel
    
    var body: some View {
        VStack {
            
            List {
                VStack(alignment: .leading) {
                    ForEach(fruits.fruitArray) { item in
                        HStack {
                            Text("\(item.count)")
                                .foregroundColor(.blue)
                            
                            HStack(spacing: 0) { //removes space between the s and item.name
                                Text(item.name)
                                item.count > 1 ? Text("s") : Text("")
                            }
                            .font(.headline)
                            .bold()
                        }
                    }
                }
            }
        }
    }
}


//struct SecondScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondScreen(fruits: )
//    }
//}
