//
//  DataFlow3.swift
//  WeSplit
//
//  Created by Andreas Nuss on 17.09.22.
//

import SwiftUI

struct MyOwnDataFlow: View {
    
    @State var myNumber = 0
    
    @State var myWord = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("My number:")
                Text("\(myNumber)")
                    .foregroundColor(myNumber == 0 ? .secondary : .primary)
            }
            
            HStack {
                Text("My input:")
                Text("\(myWord)")
            }
            
            HStack() {
                Text("Put your number in:")
                TextField("Enter", value: $myNumber, format: .number)
                
                Text("Put your text in:")
                TextField("Text", text: $myWord)
                    
            } .padding(.horizontal)
            
            
                
        }
        
        
    }
}

struct DataFlow3_Previews: PreviewProvider {
    static var previews: some View {
        MyOwnDataFlow()
    }
}
