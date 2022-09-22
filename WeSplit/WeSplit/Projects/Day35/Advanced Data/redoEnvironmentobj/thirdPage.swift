//
//  thirdPage.swift
//  WeSplit
//
//

import SwiftUI

struct thirdPage: View {
    
//    @ObservedObject var third : BreadViewModel
    @EnvironmentObject var third : BreadViewModel
    
    var body: some View {
        VStack {
            ForEach(third.breadArray) { item in
                HStack {
                    HStack {
                        Text("\(item.amount)")
                            .foregroundColor(.orange)
                        
                        if item.amount < 10 {
                            Text("")
                        }
                        
                        Text(item.color)
                            .font(.headline)
                    }
                    Spacer()
                    Text("Baked")
                        .foregroundColor(item.baked ? .primary : .secondary)
                        .fontWeight(item.baked ? .semibold : .regular)
                }
                .padding(.horizontal)
            }
        }
    }
}

