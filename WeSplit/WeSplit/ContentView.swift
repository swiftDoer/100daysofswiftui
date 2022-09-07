//
//  ContentView.swift
//  WeSplit
//
//  Created by Andreas Nuss on 07.09.22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Potter", "Run"]
    @State private var name = ""
    let colors = [2,21,3,5,4,2,2,2]
    @State private var color = 0
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $name) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Select your favorite color", selection: $color){
                    ForEach(colors, id: \.self) {
                        Text(String($0))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
