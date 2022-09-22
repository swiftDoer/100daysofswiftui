//
//  ButtonUI.swift
//  WeSplit
//
//

import SwiftUI

struct ButtonUI: View {
    
    @StateObject var button = ButtonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Multiplication Tables")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                
                HStack {
                    ForEach(button.buttonArray1) { item in
                        ButtonLooks(buttonNumber: item.number, buttonSelected: item.buttonPressed, buttong: button)
                    }
                }
                HStack {
                    ForEach(button.buttonArray2) { item in
                        ButtonLooks(buttonNumber: item.number, buttonSelected: item.buttonPressed, buttong: button)
                    }
                }
                NavigationLink(destination: {
                    StudySecondView(butting: button)
                }, label: {
                    Text("Study")
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                        .frame(width: 62, height: 40)
                        .background(.blue)
                        .cornerRadius(15)
                        .bold()
                })
                
                HStack {
                    ForEach(button.selectedButtonArray, id: \.self) { item in
                        Text("\(item)")
                    }
                }
                Spacer()
                Spacer()
                    .navigationTitle("Number Selection")
            }
        }
    }
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUI()
    }
}
