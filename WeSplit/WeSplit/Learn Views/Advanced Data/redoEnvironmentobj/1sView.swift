//
//  1sView.swift
//  WeSplit
//
//

import SwiftUI

struct oneView: View {
    
    @StateObject var bread = BreadViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(bread.breadArray) { item in
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
                
                NavigationLink(destination: {
//                    twoView(second: bread)
                    twoView()
                }, label: {
                    Text("Second")
                })
            }
            .navigationTitle("複雑")
            .environmentObject(bread)
        }
    }
}

struct _sView_Previews: PreviewProvider {
    static var previews: some View {
        oneView()
    }
}
