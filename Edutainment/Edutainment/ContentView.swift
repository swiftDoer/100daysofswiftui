//
//  ContentView.swift
//  Edutainment
//
//  
//

import SwiftUI

struct ContentView: View {
    
    @State private var startStudy = false
    @State private var multiplicationNumber = Int.random(in: 0...12)

    @State var textField = ""
    @State var score = 0
    @State var round = 0
    
    @State private var myButton6 = false
    @State private var myButton9 = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .fill(startStudy ? .green : .blue)
                        .frame(width: 25, height: 25)
                        Text("\(score)")
                            .foregroundColor(.white)
                            .bold()
                            .font(.caption)
                    }
                    
                    ZStack {
                        Circle()
                            .fill(startStudy ? .green : .blue)
                        .frame(width: 25, height: 25)
                        Text("\(round)")
                            .foregroundColor(.white)
                            .bold()
                            .font(.caption)
                    }
                }
                    
                Text("Selected Numbers:")
                HStack {
                    if myButton6 {
                        Text("6")

                    }
                    if myButton9 {
                        Text("9")
                    }

                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: {
                        ButtonSelection(button1: $myButton6, button2: $myButton9)
                    }, label: {
                        Text("Selection")
                    })
                    Spacer()
                    
                    Button(action: {
                        startStudy.toggle()
                    }, label: {
                        Text("Study")
                    })
                    Spacer()
                }
                
                HStack {
                    if myButton6 && startStudy {
                        Text("6 * \(multiplicationNumber) = ")
                        
                        TextField(text: $textField, label: {
                            Text("Answer")
                        })
                    } else if myButton9 && startStudy {
                        Text("9 * \(multiplicationNumber) = ")
                        
                        TextField(text: $textField, label: {
                            Text("Answer")
                        })
                    }
                }
                Text("\(textField)")
                
                if Int(textField) == 6 * multiplicationNumber {
                    Button(action: {
                        multiplicationNumber = Int.random(in: 0...12)
                        textField = ""
                        score += 1
                        round += 1
                    }, label: {
                        Text("Correct")
                    })
                } else if Int(textField) == 9 * multiplicationNumber{
                    Button(action: {
                        multiplicationNumber = Int.random(in: 0...12)
                        textField = ""
                        score += 1
                        round += 1
                    }, label: {
                        Text("Correct")
                    })
                } else if (Int(textField) != nil) && (Int(textField) != 6 * multiplicationNumber){
                    Button(action: {
                        textField = ""
                        round += 1
                    }, label: {
                        Text("Wrong")
                    })
                } else if (Int(textField) != nil) && (Int(textField) != 9 * multiplicationNumber){
                    Button(action: {
                        textField = ""
                        round += 1
                    }, label: {
                        Text("Wrong")
                    })
                }
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
