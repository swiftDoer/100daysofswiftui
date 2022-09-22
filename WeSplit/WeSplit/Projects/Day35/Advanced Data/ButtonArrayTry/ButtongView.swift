//
//  ButtongView.swift
//  WeSplit
//
//  ye#
//

import SwiftUI

class ButtongView: ObservableObject { //the second you change this from " struct ButtongView: View" to class ButtongView: ObservableObject you get into trouble
    
//    @ObservedObject var pressedButtongs = [Int]()
    
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
            ButtongStyle(number: 1)
        })
            
            Button(action: {
                
            }, label: {
                ButtongStyle(number: 2)
        })
            Button(action: {
                
            }, label: {
                ButtongStyle(number: 3)
        })
            
        }
    }
}


struct ButtongStyle: View {
    
    @State var buttonPressed = false
    var number : Int
    
    var body: some View {
        ZStack {
            Rectangle().fill(buttonPressed ? .green : .blue)
                .frame(width: 50, height: 50)
                .cornerRadius(15)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.largeTitle).bold()
        }
    }
}

//struct ButtongView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtongView()
//    }
//}
