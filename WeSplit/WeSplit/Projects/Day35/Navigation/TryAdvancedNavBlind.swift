//
//  TryAdvancedNavBlind.swift
//  WeSplit
//
//  Created by Andreas Nuss on 16.09.22.
//

import SwiftUI

struct TryAdvancedNavBlind: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: {
                    SecondMirror()
                }, label: {
                    Text("Hello, another world!")
                })
            }
            .navigationTitle("Hello World")
            .toolbar(content: {
                ToolbarItemGroup(placement: .bottomBar, content: {
                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Sign Out")
                    })
                })
            })
        }
    }
}


struct SecondMirror: View {
    
    @Environment(\.dismiss) var yepGoBack
    
    var body: some View {
        VStack {
            Text("Ive landed in unknown territory")
                .navigationTitle("Unknown")
            
            Button(action: {
                yepGoBack.callAsFunction()
            }, label: {
                Text("Get back")
            })
            
    //            .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar, content: {
                        Button(action: {
    //                        presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign Out")
                        })
                    })
            })
        }
        
            
    }
}

struct TryAdvancedNavBlind_Previews: PreviewProvider {
    static var previews: some View {
        TryAdvancedNavBlind()
    }
}
