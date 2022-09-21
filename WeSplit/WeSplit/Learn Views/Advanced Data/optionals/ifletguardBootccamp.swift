//
//  ifletguardBootccamp.swift
//  WeSplit
//

import SwiftUI

struct ifletguardBootccamp: View {
    
    @State var displayText : String? = nil
    @State var isLoading = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("here we're practicing save coding")
                
                if let item = displayText { //if displayText exists -> create new var item & execute the closure
                    Text(item)              //so if i comment out the function, it will just skip over these lines
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                
//                Text(displayText)
//                    .font(.title)
                
                Text(displayText ?? "Data hasn't loaded yet")
                    .font(.title)
                
                Spacer()
            }
            .navigationTitle("Safe coding")
            .onAppear(){
                loadString()
            }
        }
    }
    
    
    func loadString() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            displayText = "New Message!"
            isLoading = false
        }
    }
}

struct ifletguardBootccamp_Previews: PreviewProvider {
    static var previews: some View {
        ifletguardBootccamp()
    }
}
