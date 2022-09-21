//
//  tapgestures2.swift
//  WeSplit
//
//  Created by Andreas Nuss on 20.09.22.
//

import SwiftUI

struct tapgestures2: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 25)
                .foregroundColor(isOn ? .green : .blue)
            
            HStack {
                Button(action: {
                    isOn.toggle()
                }, label: {
                    Text("Hello")
            })
                Text("Wrld")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        isOn.toggle()
                    }
            }
            Button("Hello 🌍") {isOn.toggle()}
            
            
            
            
            
            
            
            
            Text("hi w")
                .onTapGesture(count: 2, perform: {
                    isOn.toggle()
                })
        }
    }
}

struct tapgestures2_Previews: PreviewProvider {
    static var previews: some View {
        tapgestures2()
    }
}
